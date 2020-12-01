Rails.application.routes.draw do
  root to: 'game_sheets#index'
  
  resources :game_sheets, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
