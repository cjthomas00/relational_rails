Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/teams', to: 'teams#index'
  get '/teams/new', to: 'teams#new' # <=== location of these matters, put /parent/new above /parent/:id 
  post '/teams', to: 'teams#create'
  get '/teams/:id', to: 'teams#show'
  get '/teams/:id/edit', to: 'teams#edit'
  patch '/teams/:id', to: 'teams#update'
  
  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show'
  get '/teams/:team_id/players', to: 'team_players#index'
end
