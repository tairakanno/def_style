Rails.application.routes.draw do
  devise_for :users
  root to: "tops#index"
  resources :opuses do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  resources :items do
    resources :item_comments, only: [:create]
    resources :orders, only: [:index, :create]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update, :destroy, :index] do
    get 'likes/index' => 'likes#index', as: 'index_like' 
  end
  # resources :likes, only: [:index]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
end
