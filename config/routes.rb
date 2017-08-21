Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "users#index"
  get "/users/:id", to: "users#show"
  get "/scores/:id", to: "scores#show"
  get "/scores", to: "scores#all"
  get "/quit", to: "games#destroy"
  get "/users/new", to: "user#create"

  post "/users", to: "users#session"
end
