Rails.application.routes.draw do
  root 'static_pages#index'
  get '/', to: 'static_pages#index'
  get '/search', to: 'static_pages#search'
  get '/request', to: 'friend_requests#create_friend_request'
  devise_for :users
  resources :notifications, only: [:index]
  # devise_scope :user do
  #   # get "", to: 'devise/registrations#new'
  # end
end
