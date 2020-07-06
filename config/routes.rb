Rails.application.routes.draw do
  root 'posts#index'
  get '/search', to: 'static_pages#search'
  devise_for :user
  resources :notifications, only: [:index]
  resources :friendships, except: [:new]
  resources :posts, only: [:index, :create] do 
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:index, :new, :create]
  end
end
