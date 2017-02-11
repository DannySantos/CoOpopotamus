Rails.application.routes.draw do
  devise_for :users
  root to: "application#index"
  
  resources :games, only: [:index]
  resources :marked_games, only: [:create]
end
