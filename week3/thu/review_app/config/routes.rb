ReviewApp::Application.routes.draw do
  
  root to: 'site#index'

  get '/about', to: 'site#about'

  get '/contact', to: 'site#contact'

  get '/animal', to: 'animal#index', as: :animals

  get '/animal/new', to: 'animal#new', as: :new_animal

  post 'animal/', to: 'animal#create', as: :create_animal

  get '/animals/:id', to: 'animal#show', as: :animal

  patch '/animals/:id', to: 'animal#update', as: :update_animal

  get '/animals/:id/edit', to: 'animal#edit', as: :edit_animal

end
