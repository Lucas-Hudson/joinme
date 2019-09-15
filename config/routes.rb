Rails.application.routes.draw do
  root 'venues#index'

  devise_for :users
  
  resources :users
  resources :venues
  resources :friendships
end
