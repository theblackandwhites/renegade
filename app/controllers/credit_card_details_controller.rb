class CreditCardDetailsController < ApplicationController

  def update_card
  end

  def updating_card
  	Stripe.api_key = "sk_test_BQokikJOvBiI2HlWgH4olfQ2"
  	@user = current_user

  	# Get credit card details from stripe form
  	token = params[:stripeToken]
  	# Update customer in stripe
  	cu = Stripe::Customer.retrieve(current_user.stripe_customer_id)
  	cu.description = "Updating customer credit card"
  	cu.source = token
  	cu.save

  	# Update customer in database User table
  	@user.update_attributes(stripe_customer_id: cu.id)
  	
  	redirect_to credit_card_details_update_card_path
  end

  def destroy_card
  end

  def destroying_card
  	Stripe.api_key = "sk_test_BQokikJOvBiI2HlWgH4olfQ2"
  	# Delete customer from stripe
  	cu = Stripe::Customer.retrieve(current_user.stripe_customer_id)
  	cu.delete

  	# Update customer in database User table
  	@user.update_attributes(stripe_customer_id: nil, stripe_last4: nil, stripe_brand: nil, stripe_exp_month: nil, stripe_exp_year: nil)

  	redirect_to credit_card_details_destroy_card_path
  end

end
