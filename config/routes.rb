Rails.application.routes.draw do
  
  root to: 'game_sheets#index'
  get 'static_pages/index'
  
  resources :game_sheets, only: [:index, :show]
  resources :carts, only: [:show, :update]

  devise_for :users

  resources :users do
    resources :avatars, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
