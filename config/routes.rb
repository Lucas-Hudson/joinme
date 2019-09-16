Rails.application.routes.draw do
  resources :invitatons
  root 'venues#index'
  resources :user_invites
  resources :invitations
  devise_for :users
  
  resources :users
  resources :venues do
    resources :invitations, only: [:create]
  end

  resources :friendships
 
end
