Rails.application.routes.draw do
  root 'static_pages#index'
  devise_for :users
  # devise_scope :user do
  #   # get "", to: 'devise/registrations#new'
  # end
end
