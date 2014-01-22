RouteApp::Application.routes.draw do
  root to: "planes#index"
  get '/planes/:id/edit', to: 'planes#edit' #edit plane
  get "/planes/new", to: "planes#new"       #new plane
  get '/planes/:id', to: 'planes#show'      #show plane
  get "/planes", to: "planes#index"         #show all planes

  post '/planes', to: 'planes#create'       #create plane
  put '/planes/:id', to: 'planes#update'    #update plane
end
