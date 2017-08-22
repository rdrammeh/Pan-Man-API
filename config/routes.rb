Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root "scores#all"

  post "/users", to: "users#create"
  get "/users/:id", to: "users#show"
  get "/scores/:id", to: "scores#show"
  get "/scores", to: "scores#all"
  get "/quit", to: "games#destroy"
  post "/sessions", to: "sessions#create"
  post "/users", to: "users#create"
end
