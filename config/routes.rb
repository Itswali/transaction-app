Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :categories do
    resources :transactions, only: [:index]
  end

  resources :transactions, except: [:index]

  # Your other routes go here
end
