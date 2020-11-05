Rails.application.routes.draw do
  devise_for :users
  root to: "opuses#index"
  resources :opuses do
    resources :comments, only: [:create]
  end
  resources :items do
    resources :orders, only: [:index, :create]
  end
  resources :users, only: [:show] 
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  
end
