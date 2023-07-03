Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :categories do
    resources :transactions
  end

  resources :transactions

  # Your other routes go here
end
