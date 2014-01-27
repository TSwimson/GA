CookBook::Application.routes.draw do
  resources :books, :recipes, :ingredients

  root to: 'books#index'

end

