Rails.application.routes.draw do
  root 'posts#index'
  get '/search', to: 'static_pages#search'
  devise_for :user
  resources :notifications, only: [:index]
  resources :friendships
  resources :posts
end
