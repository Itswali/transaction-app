Rails.application.routes.draw do
  root 'splash#splash'

  devise_for :users

  resources :categories, only: %i[index new create] do
    resources :transactions, only: %i[index new create]
  end

  # Your other routes go here
end
