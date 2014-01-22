Bog::Application.routes.draw do
  root to: "bog#index"
  get "/bogs/new", to: "bog#new"      #new bog
  get "/bogs/:id/edit", to: "bog#edit"    #edit bog
  get "/bogs/:id", to: "bog#show"     #show bog
  get "/bogs", to: "bog#index"        #show all bogs

  post "/bog", to: "bog#create"      #create bog
  put  "/bogs/:id", to: "bog#update"  #update bog
  delete "/bogs/:id", to: "bog#delete" #delete bog
end
