Rails.application.routes.draw do

  # Define an auction resource
  resources :auctions do
  		get :delete, on: :member
  		resources :buyers
  end

  # Root of application should be auctions
  root 'auctions#index'

end
