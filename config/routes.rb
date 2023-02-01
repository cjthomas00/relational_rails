Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/players', to: 'players#index'
  get '/teams', to: 'teams#index'
  get '/teams/:id', to: 'teams#show'
end
