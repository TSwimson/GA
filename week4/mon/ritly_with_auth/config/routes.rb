Ritly::Application.routes.draw do
  resources :users, :sessions

  root to: 'urls#index'                             #index and new page
  post "/", to: 'urls#create'                       #post create url route

  get '/signup', to: 'users#new' 
  match '/signout', to: 'sessions#destroy', via: :delete
  get'/signin', to: 'sessions#new'

  post '/signin', to: 'sessions#create'

  get '/show/:short', to: 'urls#show', as: :show_url #show url stats
  get '/go/:short', to: 'url#go'
  get '/go/:short/preview', to: 'url#show'
  get '/:short', to: 'urls#go'                      #go to url


end
