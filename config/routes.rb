Rails.application.routes.draw do
  root "tasks#index"

  get '/tasks', to: "tasks#index"
  get '/tasks/new', to: "tasks#new"
  get '/tasks/:id', to: "tasks#show"
  post '/tasks', to: "tasks#create"
  delete '/tasks/:id', to: "tasks#destroy"
end
