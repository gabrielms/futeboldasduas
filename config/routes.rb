Futeboldasduas::Application.routes.draw do



  root to: 'ranking#index'

  resources :matches, :players
  resources :sessions, only:[:new, :create, :destroy]

  match '/sobre',   to: 'pages#about'
  match '/contato', to: 'pages#contact'
  match '/signup',  to: 'user#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete 
  match '/novapartida', to: 'matches#new'
  match '/novojogador', to: 'players#new'
  match '/ranking', to: 'ranking#index'
 


end
