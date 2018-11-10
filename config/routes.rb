Rails.application.routes.draw do
  root to: 'pages#home'

  resources :tracks, only: [:index, :show]

  get '/portfolio', to: 'pages#portfolio'
  get '/about', to: 'pages#about'
end
