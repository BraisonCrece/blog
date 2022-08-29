Rails.application.routes.draw do
  # get 'sessions/destroy'
  resources :sessions, only: %i[destroy]

  # get 'registrations/new'
  # get 'registrations/create'

  resources :registrations, only: %i[new create]

  # get 'logins/new'
  # get 'logins/create'

  resources :logins, only: %i[new create]

  # get 'posts/new'
  # get 'posts/create'
  # get 'posts/show'
  # get 'posts/edit'
  # get 'posts/update'
  # get 'posts/destroy'

  resources :posts, only: %i[new create show edit update destroy]

  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'

  resources :users, only: %i[new create show edit update]

  # get 'blog/index'

  resources :blog, only: %i[index]

  root 'blog#index'
end
