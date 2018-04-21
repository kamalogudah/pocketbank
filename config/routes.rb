Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/back_office', as: 'rails_admin'
  resources :categories
  resources :accounts
  resources :transactions
  get 'landing/welcome'
  root 'landing#welcome'
  get 'landing/about'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
