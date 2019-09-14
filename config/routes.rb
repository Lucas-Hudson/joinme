Rails.application.routes.draw do
  devise_for :users
  root 'venues#index'

  resources :users
  resources :venues
 
end
