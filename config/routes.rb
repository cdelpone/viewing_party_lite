Rails.application.routes.draw do
  root to: 'main#index'

  get '/register', to: 'user#new'
  post '/register', to: 'user#create'
  get '/user/:id', to: 'user#show'

  get '/user/:id/discover', to: 'discover#show'
  get '/user/:id/movies', to: 'movies#index'
end
