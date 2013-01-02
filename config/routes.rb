Futeboldasduas::Application.routes.draw do


  get "player_matches/new"

  get "player_matches/create"

  get "player_matches/show"

  root to: 'pages#home'

  resources :matches, :players
  resources :sessions, only:[:new, :create, :destroy]

  match '/sobre',   to: 'pages#about'
  match '/contato', to: 'pages#contact'
  match '/signup',  to: 'user#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete 
  match '/novapartida', to: 'matches#new'
  match '/novojogador', to: 'players#new'
 


end
