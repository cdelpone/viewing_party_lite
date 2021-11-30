Rails.application.routes.draw do
  root to: 'main#index'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/users/:id', to: 'users#show'

  get '/users/:id/discover', to: 'discover#show'
  get '/users/:id/movies', to: 'movies#index'
end
