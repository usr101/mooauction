Rails.application.routes.draw do

  # Define an auction resource
  resources :auctions

  # Root of application should be auctions
  root 'auctions#index'
  
end
