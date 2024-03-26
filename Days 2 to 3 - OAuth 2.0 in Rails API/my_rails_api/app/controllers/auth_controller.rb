class AuthController < ApplicationController
    skip_before_action :check_token_authorization, only: [:login]
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    def login
        if login_params[:email]
            @user = User.find_by(email: login_params[:email])
        elsif login_params[:username]
            @user = User.find_by(username: login_params[:username])
        end

        puts @user
        if @user&.authenticate(login_params[:password])
            token = encode_token(user_id: @user.id)
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
        }, status: :unauthorized
    end

end
