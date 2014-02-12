NestedResources::Application.routes.draw do
  get "posts/index"
  devise_for :users

  get '/posts', to: 'posts#index', as: :posts
  root to: 'posts#index'
end
