Rails.application.routes.draw do
  # Users
  post "/register", to: "users#create"
  get "/me", to: "users#me"

  # Auth
  post "/auth/login", to: "auth#login"
end
