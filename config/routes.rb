Rails.application.routes.draw do
  resources :invitatons
  root 'venues#index'

  devise_for :users
  
  resources :users
  resources :venues
  resources :friendships
 
end
