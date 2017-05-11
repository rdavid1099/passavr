Rails.application.routes.draw do
  devise_for :users
  root to: 'about#show'
end
