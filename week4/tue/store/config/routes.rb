Store::Application.routes.draw do

  get '/products/', to: 'products#index'
  get "products/:id/show", to: 'products#show', as: :product
  get "products/:id/edit", to: 'products#edit', as: :edit_product
  get "products/new", to: 'products#new', as: :new_product
  post "/products/", to: 'products#create'#, as: :products
  patch "/products/:id/show", to: 'products#update', as: :update_product
  delete '/products/:id', to: 'products#destroy', as: :delete_product

  get '/categories/', to: 'categories#index'
  get "categories/:id/show", to: 'categories#show', as: :category
  get "categories/:id/edit", to: 'categories#edit', as: :edit_category
  get "categories/new", to: 'categories#new', as: :new_category
  post "/categories/", to: 'categories#create'#, as: :categories
  patch "/categories/:id/show", to: 'categories#update', as: :update_category
  delete '/categories/:id', to: 'categories#delete', as: :delete_category
  
end
