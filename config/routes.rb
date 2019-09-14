Rails.application.routes.draw do
  devise_for :users
  root 'venues#index'

  resources :venues
 
end
