Rails.application.routes.draw do
  # Registration
  post "/register", to: "registration#create"
  get "/confirmEmail", to: "registration#confirm_email"
  
  # Login
  post "/login", to: "login#login"

  # Password
  post "/passwordForgotten", to: "password#password_forgotten"
  post "/resetPassword", to: "password#reset_password"

  # User
  get "/me", to: "users#me"
end
