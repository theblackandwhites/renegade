Rails.application.routes.draw do
  get 'credit_card_details/update_card'
  get 'credit_card_details/destroy_card'
  post 'credit_card_details/updating_card'
  get 'credit_card_details/destroying_card'

  get 'dashboard/billing'

  get 'dashboard/sponsored_missions'

  post 'charge/make_charge'
  get 'charge/make_charge'

  get 'charge/assign_to_mission'
  get 'charge/thank_you'
  get 'charge/update_rank'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :care_packages
  resources :missions
  resources :ranks
  get 'static/home'
  root to: "static#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
