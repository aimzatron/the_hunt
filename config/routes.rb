TheHunt::Application.routes.draw do

  resources :games


  resources :single_games


  root :to => "home#index"
  get '/auth/foursquare/callback', to: 'sessions#create'
  match '/auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match 'players', to: 'games#_players', as: 'players'
  match '/games/new', to: 'games#new'
  match 'single_game', to: 'single_games#new', as: 'single_game'
end
