Rails.application.routes.draw do
  
  # Test implémentation devise
  root 'static_pages#index'
  get 'static_pages/secret'
  
  devise_for :users

  resources :users do
    resources :avatars, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
