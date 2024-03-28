class LoginController < ApplicationController
    skip_before_action :check_token_authorization, only: [:login]
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    def login
        if !login_params[:password]
            render json: {
                error: "Password is required to login."
            }, status: :unauthorized
            return
        end

        if login_params[:email]
            @user = User.find_by!(email: login_params[:email])
        elsif login_params[:username]
            @user = User.find_by!(username: login_params[:username])
        else
            render json: {
                error: "Email or username are required to login."
            }, status: :unauthorized
            return
        end

        # "authenticate" is a method provided by has_secure_password
        # that checks if the password provided is correct. It does that by hashing the password.
        if @user.authenticate(login_params[:password])  # "&." prevents a NoMethodError if @user is nil.
            token = get_encoded_token(user_id: @user.id)
            render json: { 
                user: UserSerializer.new(@user),
                token: token
            }, status: :accepted
        else
            render json: {
                error: "Invalid username or password"
            }, status: :unauthorized    
        end
    end

    private
    
    def login_params
        params.permit(:email, :username, :password)
    end
    
    def handle_record_not_found
        render json: {
            error: "Invalid username or password"
        }, status: :not_found
    end
end
