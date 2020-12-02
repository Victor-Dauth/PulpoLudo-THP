Rails.application.routes.draw do
  
  root to: 'game_sheets#index'
  get 'static_pages/index'
  
  resources :game_sheets, only: [:index, :show] do
    resources :game_pictures, only: [:create]
  end

  devise_for :users

  resources :users do
    resources :avatars, only: [:create]
  end

  resources :subscriptions

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
