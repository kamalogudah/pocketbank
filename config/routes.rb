Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/back_office', as: 'rails_admin'
  resources :categories
  resources :accounts
  resources :transactions 
  get 'landing/welcome'
  root 'landing#welcome'
  get 'landing/about'
  devise_for :users
end
