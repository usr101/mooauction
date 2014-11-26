Rails.application.routes.draw do

  # Define an auction resource
  resources :auctions do
  		get :delete, on: :member
  		resources :buyers do
  			collection do
  				get 'import'
          post 'import', action: 'upload'
  			end
  		end
      resources :seller_types do
        get :delete, on: :member
        resources :sellers do
          collection do
            get 'import'
            post 'import', action: 'upload'
          end
        end
      end
  end

  # Root of application should be auctions
  root 'auctions#index'

end
