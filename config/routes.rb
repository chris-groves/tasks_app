Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root "tasks#index"

  resources :tasks

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :show, :destroy]

  namespace :api do
    resources :tasks, only: [:index]
  end
end
