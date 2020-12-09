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
    resources :orders, only: [:index, :show, :create, :update] do
      resources :shippings, only: [:show, :update]
    end
    resources :subscriptions, only: [:index, :new, :create, :update]
  end

  resources :carts, only: [:show, :update]

  resources :games, only: [:update]

  get 'static_pages/landing'
  

  namespace :stripe do
    resources :checkouts
    get 'checkout/success', to: 'checkouts#success', as: 'checkouts_success'
    get 'checkout/cancel', to: 'checkouts#cancel', as: 'checkouts_cancel'
    post 'checkout/webhook', to: "checkouts#webhook", as: 'checkouts_webhook'


  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
