CookBook::Application.routes.draw do
  get "sessions/new"

  get "sessions/destroy"

  get "users/new"

  get "users/show"

  get "users/create"

  resources :books, :recipes, :ingredients

  root to: 'books#index'

end

