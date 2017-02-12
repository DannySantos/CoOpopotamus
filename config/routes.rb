Rails.application.routes.draw do
  devise_for :users
  root to: "games#index"
  
  resources :games, only: [:index]
  resources :marked_games, only: [:index, :create]
end
