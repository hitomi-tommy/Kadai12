Rails.application.routes.draw do
  resources :labels
  namespace :admin do
    resources :users
  end
  root "tasks#index"
  resources :tasks
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
