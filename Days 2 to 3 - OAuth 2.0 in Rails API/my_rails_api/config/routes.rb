Rails.application.routes.draw do
  # Users
  post "/register", to: "users#create"
  get "/me", to: "users#me"
  get "/confirm", to: "users#confirm"
  post "/passwordForgotten", to: "users#password_forgotten"
  post "/resetPassword", to: "users#reset_password"

  # Auth
  post "/auth/login", to: "auth#login"
end
