Rails.application.routes.draw do
  root 'venues#index'
  resources :user_invites
  resources :invitations
  devise_for :users

  resources :users
  resources :venues do
    resources :invitations, only: [:create]
  end

  resources :friendships
  resources :tags
  resources :notif_actions, only: [:index]

  namespace :admin do
    root 'users#index'
    resources :users, except: [:create, :new, :edit]
    resources :administrators, except: [:new, :edit, :destroy, :show]
    resources :owners, except: [:new, :edit, :destroy, :show]
  end

end
