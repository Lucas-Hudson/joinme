Rails.application.routes.draw do
  resources :user_invites
  resources :invitations
  root 'venues#index'

  devise_for :users
  
  resources :users
  resources :venues do
    resources :invitations, only: [:create]
  end

  resources :friendships
 
end
