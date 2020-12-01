Rails.application.routes.draw do
  
  # Test implementation devise
  root 'static_pages#index'
  
  devise_for :users

  resources :users do
    resources :avatars, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
