class UsersController < ApplicationController
    def me
        render json: { 
            user: UserSerializer.new(current_user) 
        }, status: :ok
    end
end
