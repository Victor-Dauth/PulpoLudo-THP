Rails.application.routes.draw do
  
  root to: 'game_sheets#index'
  
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
    resources :subscriptions, except: [:index]
  end

  resources :carts, only: [:show, :update]

  resources :games, only: [:update]

  namespace :stripe do
    resources :checkouts
    get 'checkout/success', to: 'checkouts#success', as: 'checkouts_success'
    get 'checkout/cancel', to: 'checkouts#cancel', as: 'checkouts_cancel'
    post 'checkout/webhook', to: 'checkouts#webhook'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
