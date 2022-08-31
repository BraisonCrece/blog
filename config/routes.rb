Rails.application.routes.draw do
  resources :registrations, only: %i[new create]
  resources :logins, only: %i[new create]
  resources :posts, only: %i[index new create show edit update destroy]
  resources :users, only: %i[new create show edit update]
  resources :blog, only: %i[index]
  delete 'logout', to: 'logins#destroy', as: :logout

  root 'blog#index', as: :root
end
