TheHunt::Application.routes.draw do
  root :to => "home#index"
  get '/auth/foursquare/callback', to: 'sessions#create'
  match '/auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
end
