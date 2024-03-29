# Every controller will inherit from this class.
class ApplicationController < ActionController::API

    before_action :check_token_authorization
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    def refresh_token
        decoded_token = get_decoded_token
        user_id = decoded_token[0]['user_id']
        user = User.find_by!(id: user_id)
        token, exp = get_encoded_token(user_id: user.id)
        render json: {
            token: token
        }, status: :ok
    end

    # Generates a token with the user's ID and the current time.
    # Updates the user's token_expiration attribute with the expiration time.
    # Returns the token and the expiration time.
    def get_encoded_token(payload)
        expiration = 15.days.from_now
        payload[:expiration] = expiration
        token = JWT.encode(payload, 'my_secret_key') 
        
        User.find_by!(id: payload[:user_id]).update!(token_expiration: expiration)

        return token, expiration
    end

    def get_decoded_token
        authorization_header = request.headers['Authorization']
        if authorization_header
            token = authorization_header.split(' ')[1]
            begin
                # Decode the token using the secret key.
                # - "true" means that the algorithm is verified
                # - "algorithm: 'HS256'" specifies the algorithm used to encode the token
                JWT.decode(token, 'my_secret_key', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        decoded_token = get_decoded_token
        if decoded_token
            user_id = decoded_token[0]['user_id']
            begin
                @user = User.find_by!(id: user_id)
                token_expiration = @user.token_expiration
                if token_expiration < Time.now
                    render json: { error: 'Token expired' }, status: :unauthorized
                else
                    return @user
                end
            rescue ActiveRecord::RecordNotFound
                render json: { error: 'User not found' }, status: :not_found
            end
        end
    end

    def check_token_authorization
        unless !!current_user  # !! converts the value to a boolean
            render json: { error: 'Please log in' }, status: :unauthorized
        end
    end

    def handle_record_not_found
        render json: {
            error: "Record not found"
        }, status: :not_found
    end
end
