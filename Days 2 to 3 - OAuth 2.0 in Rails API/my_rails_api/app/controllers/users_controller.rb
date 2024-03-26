class UsersController < ApplicationController
    skip_before_action :check_token_authorization, only: [:create, :confirm]
    rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

    def create
        user = User.create!(user_params)
        token = encode_token(user_id: user.id)
        
        render json: { 
            user: UserSerializer.new(user),
            token: token
        }, status: :created

        UserMailer.confirmation_email(user).deliver_now!
    end

    def confirm
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

    def me
        render json: { 
            user: UserSerializer.new(current_user) 
        }, status: :ok
    end

    def password_forgotten
        @user.generate_password_token!
        UserMailer.password_reset_email(@user).deliver_now!
        render json: {
            message: "Password reset email sent"
        }, status: :ok
    end

    def reset_password
        password_reset_token = reset_password_params[:password_reset_token]
        @user = User.find_by!(password_reset_token: password_reset_token)

        puts "Token sent: #{@user.password_reset_sent_at}"

        # Check if the token is valid
        if @user.password_reset_sent_at < 2.hours.ago
            # TODO Refresh or delete token
            render json: {
                error: "Password reset token expired"
            }, status: :unprocessable_entity
            return
        end

        # Check if the new password and confirmation match
        new_password = reset_password_params[:new_password]
        new_password_confirmation = reset_password_params[:new_password_confirmation]
        if new_password != new_password_confirmation
            render json: {
                error: "Passwords do not match"
            }, status: :unprocessable_entity
            return
        end

        # Update the user's password
        @user.update!(password: new_password, password_reset_token: nil)
        render json: {
            message: "Password reset successfully"
        }, status: :ok
    end


    private

    def user_params
        params.permit(:username, :email, :password, :bio)
    end

    def reset_password_params
        params.permit(:password_reset_token, :new_password, :new_password_confirmation)
    end

    def password_forgotten_params
        params.permit(:email)
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
