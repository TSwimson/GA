CookBook::Application.routes.draw do
  resources :books, :recipes, :ingredients, :users, :sessions

	root to: 'books#index'

	get '/signup', to: 'users#new'
	match '/signout', to: 'sessions#destroy', via: :delete
	get'/signin', to: 'sessions#new'

end

