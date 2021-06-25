Rails.application.routes.draw do
  root "tasks#index"

  get "/users/new", to: "users#new"

  resources :tasks
end
