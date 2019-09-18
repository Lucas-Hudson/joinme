Rails.application.routes.draw do

  get 'administrators/index'
  get 'administrators/update'
  get 'administrators/destroy'
  root 'venues#index'
  resources :user_invites
  resources :invitations
  devise_for :users

  resources :users
  resources :venues do
    resources :invitations, only: [:create]
  end

  resources :friendships

  namespace :admin do
    root 'users#index'
    resources :users
    resources :administrators
  end

end
