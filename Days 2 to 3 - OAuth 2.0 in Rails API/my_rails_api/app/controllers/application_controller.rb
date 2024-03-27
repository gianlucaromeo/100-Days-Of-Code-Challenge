# Every controller will inherit from this class.
class ApplicationController < ActionController::API

    before_action :check_token_authorization

    def get_encoded_token(payload)
        expiration = 24.hours.from_now
        payload[:exp] = expiration.to_i
        JWT.encode(payload, 'my_secret_key')
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
                @user = User.find_by!(id: user_id)  # "find_by!" raises an exception if the record is not found
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
end
