Rails.application.routes.draw do
  root 'posts#index'
  get '/search', to: 'static_pages#search'
  
  devise_for :user, controllers: { registrations: 'users/registrations' }
  
  resources :users, only: [] do
    resource :profile, only: [:create, :update, :show]
  end
  resources :notifications, only: [:index]
  resources :friendships, except: [:new]
  resources :posts, only: [:index, :create] do 
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
end
