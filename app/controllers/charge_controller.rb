class ChargeController < ApplicationController
  skip_before_filter :verify_authenticity_token  

  def make_charge
  	@care_package = MissionCarePackage.find(params[:care_package])

  	# Stripe API Key
  	Stripe.api_key = "sk_test_BQokikJOvBiI2HlWgH4olfQ2"

    # Get credit card details from stripe form
    token = params[:stripeToken]

  	# If user is signed in try to find stripe_customer_id, if none create a new customer in stripe
  	if current_user.stripe_customer_id.blank?
	  	# Create customer in stripe
	  	customer = Stripe::Customer.create(
	  	  :email => params[:email],
	  	  :source => token
	  	)
    end

  	# If user is signed_in charge the user's card via stripe_customer_id, else charge via token:
  	if current_user.stripe_customer_id.present?
	  	charge = Stripe::Charge.create(
	  	  :amount => (@care_package.care_package.price * 100).ceil,
	  	  :currency => "aud",
	  	  :description => "Renegade #{@care_package.mission.title}",
	  	  :statement_descriptor => "Donation for #{@care_package.care_package.title}",
	  	  :customer => current_user.stripe_customer_id
	  	)
	  else
  		charge = Stripe::Charge.create(
  		  :amount => (@care_package.care_package.price * 100).ceil,
  		  :currency => "aud",
  		  :description => "Renegade #{@care_package.mission.title}",
  		  :statement_descriptor => "Donation for #{@care_package.care_package.title}",
  		  :customer => customer.id
  		)
	  end

  	# Get current user and save customer and charge/cc details to user record
  	@user = current_user
    if current_user.stripe_customer_id.blank?
  	@user.update_attributes(stripe_customer_id: customer.id, stripe_last4: charge.source.last4, stripe_brand: charge.source.brand, stripe_exp_month: charge.source.exp_month, stripe_exp_year: charge.source.exp_year)
    else
    @user.update_attributes(stripe_customer_id: current_user.stripe_customer_id, stripe_last4: charge.source.last4, stripe_brand: charge.source.brand, stripe_exp_month: charge.source.exp_month, stripe_exp_year: charge.source.exp_year)  
    end
  	# Create a new charge in database charge table
  	@new_charge = Charge.new(
  							user_id: current_user.id,
  							mission_id: @care_package.mission_id,
  							care_package_id: @care_package.care_package_id,
  							amount: charge.amount / 100,
  							status: "pending", # Waiting on webhook for appropirate update
  							message: "Your payment is currently pending."
  							)
  	@new_charge.save

  	redirect_to charge_assign_to_mission_path(:care_package => @care_package.id)

  end

  def assign_to_mission
  	# Get query params
  	@care_package = MissionCarePackage.find(params[:care_package])

  	#assign user to mission
  	@user_mission = UserMission.new(user_id: current_user.id, mission_id: @care_package.mission_id )
  	@user_mission.save

  	redirect_to charge_update_rank_path(:care_package => @care_package.id)
  end

  def update_rank
  	# Get query params
  	@care_package = MissionCarePackage.find(params[:care_package])

  	# Get current user if they have a rank already then + 1 if not set rank to 1
  	@user = current_user
  	if @user.rank_id.present?
  		@user.update_attributes(rank_id: @user.rank_id + 1)
  	else
  		@user.update_attributes(rank_id: 1)
  	end

  	redirect_to charge_thank_you_path(:care_package => @care_package.id)
  end 

  def thank_you
  	# Get query params
  	@care_package = MissionCarePackage.find(params[:care_package])
  end

end
