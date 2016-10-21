Rails.application.routes.draw do
  resources :microposts, only: [:new, :create, :destroy]
  resources :users do
    member do
      get :following
      get :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  get '/signup',  to: 'users#new'
  get '/signin',  to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
end
