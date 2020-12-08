Rails.application.routes.draw do
  

  
  authenticated :user do
    root 'game_sheets#index'
    end
    root 'static_pages#landing'


  
  resources :game_sheets, only: [:index, :show] do
    resources :game_pictures, only: [:create]
  end

  devise_for :users

  resources :users do
    resources :avatars, only: [:create]
    resources :addresses, except: [:show]
    resources :orders, only: [:index, :create] do
      resources :shippings, only: [:show, :update]
    end
    resources :subscriptions, only: [:index, :new, :create, :update]
  end

  resources :carts, only: [:show, :update]

  resources :games, only: [:update]

  #resources :landing_pages, only: [:show]
  get 'static_pages/landing'
  


  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
