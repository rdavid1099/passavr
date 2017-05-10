Rails.application.routes.draw do
  devise_for :users
  root to: 'sessions#new'

  get '/login', to: 'sessions#new'
end
