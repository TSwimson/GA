RouteApp::Application.routes.draw do
  root to: "planes#index"
  get '/planes/:id/edit', to: 'planes#edit'
  get "/planes/new", to: "planes#new"
  get '/planes/:id', to: 'planes#show'
  get "/planes", to: "planes#index"
  post '/planes', to: 'planes#create'
  put '/planes/:id', to: 'planes#update'
end
