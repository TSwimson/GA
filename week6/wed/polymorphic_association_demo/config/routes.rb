Polymorf::Application.routes.draw do
  get "photos/new"
  get "photos/show"
  get "/", to: "books#index"
  resources :books do
    resources :comments
  end
   resources :photos do
    resources :comments
  end
end
