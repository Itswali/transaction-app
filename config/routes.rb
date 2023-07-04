Rails.application.routes.draw do
  root 'pages#hello'

  get '/home', to: 'home#index', as: 'home_index'

  devise_for :users

  resources :categories do
    resources :transactions
  end

  resources :transactions

  # Your other routes go here
end
