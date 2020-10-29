Rails.application.routes.draw do
  devise_for :users
  root to: "opuses#index"
  get 'opuses/index'
  resources :users, only: [:show]
end
