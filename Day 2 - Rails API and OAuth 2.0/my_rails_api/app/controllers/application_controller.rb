# Every controller will inherit from this class.
class ApplicationController < ActionController::API

    before_action :check_token_authorization

    def encode_token(payload)
        expiration = 24.hours.from_now
        payload[:exp] = expiration.to_i
        JWT.encode(payload, 'my_secret_key')
    end

    def decoded_token
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
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def check_token_authorization
        unless !!current_user
            render json: { errors: 'Please log in' }, status: :unauthorized
        end
    end
end
