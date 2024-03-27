class RegistrationController < ApplicationController
    skip_before_action :check_token_authorization, only: [:create, :confirm_email]
    rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

    def create
        if !registration_params[:password]
            render json: {
                error: "Password is required"
            }, status: :unprocessable_entity
            return
        end

        # assert that both email and username are given
        if !registration_params[:email] || !registration_params[:username]
            render json: {
                error: "Email and username are required"
            }, status: :unprocessable_entity  # 422
            return
        end

        user = User.create!(registration_params)
        token = get_encoded_token(user_id: user.id)
        
        render json: { 
            user: UserSerializer.new(user),
            token: token
        }, status: :created

        UserMailer.confirmation_email(user).deliver_now!
    end

    def confirm_email
        token = email_confirmation_params[:token]
        puts token
        user = User.find_by(confirmation_token: token)
        if user.present?
            user.confirm!
            render json: {
                message: "Email confirmed successfully"
            }, status: :ok
        else
            render json: {
                error: "Invalid confirmation token"
            }, status: :unprocessable_entity
        end
    end

    private

    def registration_params
        # To force some parameters to be present, we can use the require method
        params.permit(:username, :email, :password, :bio)
    end

    def email_confirmation_params
        params.permit(:token)
    end

    def handle_invalid_record(e)
        render json: {
            errors: e.record.errors.full_messages 
        }, status: :unprocessable_entity
    end
end
