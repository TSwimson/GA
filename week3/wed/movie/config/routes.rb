Movie::Application.routes.draw do

  resources :movies

  root 'movies#index'

  # get 'movies'  => 'movies#index', as: :movies

  # get 'movies/new' => 'movies#new', as: :new_movie

  # get 'movies/:id' => 'movies#show', as: :movie

  # get 'movies/:id' => 'movies#destroy'

  # get 'movies/:id/edit' => 'movies#edit', as: :edit_movie

  # patch 'movies/:id' => 'movies#update'
  post "movies/new" => 'movies#create'
end
