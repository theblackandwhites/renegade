class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
												    	:first_name, 
												    	:last_name, 
												    	:mobile, 
												    	:country, 
												    	:postcode, 
												    	:stripe_customer_id, 
												    	:stripe_last4, 
												    	:stripe_brand, 
												    	:stripe_exp_month, 
												    	:stripe_exp_year,
												    	:rank_id
												    	])

    devise_parameter_sanitizer.permit(:account_update , keys: [
												    	:first_name, 
												    	:last_name, 
												    	:mobile, 
												    	:country, 
												    	:postcode,
												    	:rank_id
												    	])
  end
end
