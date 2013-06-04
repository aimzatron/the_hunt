TheHunt::Application.routes.draw do
  root :to => "home#index"
  get '/auth/foursquare/callback', to: 'sessions#create'
  match '/auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  resources :games
  resources :solo_games, controller: :games
  resources :multi_games, controller: :games

end
