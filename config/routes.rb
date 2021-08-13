Rails.application.routes.draw do
  root "tasks#index"

  resources :tasks

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :show, :destroy]

  namespace :api do
    resources :tasks, only: [:index]
  end
end
