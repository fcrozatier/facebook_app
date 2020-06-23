Rails.application.routes.draw do
  root 'static_pages#index'
  get '/search', to: 'static_pages#search'
  devise_for :users
  # devise_scope :user do
  #   # get "", to: 'devise/registrations#new'
  # end
end
