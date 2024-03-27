Rails.application.routes.draw do
  # Login
  post "/auth/login", to: "login#login"
  
  # Registration
  post "/register", to: "registration#create"
  get "/confirmEmail", to: "registration#confirm_email"

  # Password
  post "/passwordForgotten", to: "password#password_forgotten"
  post "/resetPassword", to: "password#reset_password"

  # User
  get "/me", to: "users#me"
end
