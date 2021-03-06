Rails.application.routes.draw do

  get 'profiles/edit_password'

  get 'profiles/update_password'

  get 'sessions/new'

  namespace :admin do
    get 'dashboard/index'
  end

  get 'admindashboard/index'

  # Define an auction resource
  resources :auctions do
  		get :delete, on: :member

      resources :buyers do
        collection do
          get 'import'
          post 'import', action: 'upload'
        end
      end
  		
      resources :seller_types, except: :show do 

        resources :sellers do
          collection do
            get 'import'
            post 'import', action: 'upload'
          end
        end
        resources :bids
      end

      resources :invoices

  end

  # Login and Logout routes
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # Change password routes
  get 'change_password' => 'profiles#edit_password'
  post 'change_password' => 'profiles#update_password'

  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :users
  end

  # Root of application should be auctions
  root 'auctions#index'

end
