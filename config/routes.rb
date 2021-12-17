Rails.application.routes.draw do
  root 'welcome#index'

  # resources :users, only: [:new, :create]
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'dashboard', to: 'users#show'

  get '/discover', to: 'discover#show', as: "discover_show"
  get '/movies', to: 'movies#index', as: "movie_index"
  get '/movies/:id', to: 'movies#show', as: "movie_show"
  get '/movies/:id/viewing_party/new', to: 'party#new', as: "new_viewing_party"
  post '/movies/:id/viewing_party/new', to: 'party#create'
end
