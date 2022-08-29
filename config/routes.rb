Rails.application.routes.draw do
  resources :registrations, only: %i[new create]
  resources :logins, only: %i[new create]
  resources :posts, only: %i[new create show edit update destroy]
  resources :users, only: %i[new create show edit update]
  resources :blog, only: %i[index]
  delete "logout", to: "sessions#destroy", as: :logout

  root 'blog#index'
end
