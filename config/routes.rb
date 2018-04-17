Rails.application.routes.draw do
  resources :accounts
  resources :transactions
  resources :reports
  get 'landing/welcome'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
