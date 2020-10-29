Rails.application.routes.draw do
  devise_for :users
  root to: "opuses#index"
  resources :opuses, only: [:index, :new]
  resources :users, only: [:show]
end
