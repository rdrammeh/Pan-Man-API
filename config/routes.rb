Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root "scores#all"

  get "/users/:id", to: "users#show"
  get "/scores/:id", to: "scores#show"
  get "/scores", to: "scores#all"
  get "/quit", to: "games#destroy"

  post "/sessions", to: "sessions#create"
  post "/users", to: "users#create"
  post "/games/:id", to: "games#create"

  put "/games/:id", to: "games#update"

  delete "/game/:id", to: "games#destroy"

end
