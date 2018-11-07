Rails.application.routes.draw do
  root to: 'tracks#index'

  resources :tracks, only: [:index, :show]
end
