Rails.application.routes.draw do
  root 'static_pages#index'
  get '/search', to: 'static_pages#search'
  devise_for :users
  resources :notifications, only: [:index]
  resources :friendships, except: [:index]
  # devise_scope :user do
  #   # get "", to: 'devise/registrations#new'
  # end
end
