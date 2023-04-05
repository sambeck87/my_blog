Rails.application.routes.draw do
  root 'users#index'
  get "/users", to: 'users#index', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  post '/users/:user_id/posts', to: 'posts#create'
  get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_post'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  post '/users/:user_id/posts/:id', to: 'comments#create'
  get '/users/:user_id/posts/:id/comments/new', to: 'comments#new', as: 'new_comment'
  post '/users/:user_id/posts/:id/likes', to: 'likes#create', as: 'add_like'
end
