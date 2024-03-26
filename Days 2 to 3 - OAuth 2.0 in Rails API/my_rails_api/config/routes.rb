Rails.application.routes.draw do
  # Users
  post "/register", to: "users#create"
  get "/me", to: "users#me"
  get "/confirm", to: "users#confirm"

  # Auth
  post "/auth/login", to: "auth#login"
end
