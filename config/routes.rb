Rails.application.routes.draw do
  root 'static_pages#index'
  get '/', to: 'static_pages#index'
  get '/search', to: 'static_pages#search'
  devise_for :users
  resources :notifications, only: [:index]
  resources :friend_requests, except: [:index]
  # devise_scope :user do
  #   # get "", to: 'devise/registrations#new'
  # end
end
