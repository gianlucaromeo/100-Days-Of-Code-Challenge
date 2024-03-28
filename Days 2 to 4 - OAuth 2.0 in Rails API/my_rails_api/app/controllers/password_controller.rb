class PasswordController < ApplicationController
    skip_before_action :check_token_authorization, only: [:password_forgotten, :reset_password]
    rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    def password_forgotten
        if !password_forgotten_params[:email]
            render json: {
                error: "Email is required"
            }, status: :unprocessable_entity
            return
        end

        user = User.find_by!(email: password_forgotten_params[:email])
        user.generate_password_token!
        UserMailer.password_reset_email(user).deliver_now!
        render json: {
            message: "Password reset email sent"
        }, status: :ok
    end

    def reset_password
        if !reset_password_params[:password_reset_token]
            render json: {
                error: "Password reset token is required"
            }, status: :unprocessable_entity
            return
        end

        password_reset_token = reset_password_params[:password_reset_token]
        user = User.find_by!(password_reset_token: password_reset_token)

        puts "Token sent: #{user.password_reset_sent_at}"

        # Check if the token is valid
        if user.password_reset_sent_at < 2.hours.ago
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
        user.update!(password: new_password, password_reset_token: nil)
        render json: {
            message: "Password reset successfully"
        }, status: :ok
    end

    private
    
    def password_forgotten_params
        params.permit(:email)
    end
    
    def reset_password_params
        params.permit(:password_reset_token, :new_password, :new_password_confirmation)
    end

    def handle_invalid_record(e)
        render json: {
            errors: e.record.errors.full_messages 
        }, status: :unprocessable_entity
    end

    def handle_record_not_found
        render json: {
            error: "User not found"
        }, status: :not_found
    end
end
