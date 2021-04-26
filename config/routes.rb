Rails.application.routes.draw do
  get '/tasks', to: "tasks#index"
  get '/tasks/new', to: "tasks#new"
  post '/tasks', to: "tasks#create"

  get "actions", to: "actions#index"
  get "/actions/new", to: "actions#new"
  post "/actions", to: "actions#create"

end
