require 'test_helper'

class RefreshTokenTest < ActionDispatch::IntegrationTest
    setup do
        @user = {
            "email": "test@test.it",
            "username": "test",
            "password": "test_password"
        }
        User.create!(@user)        
        puts "\n[START]"
    end

    teardown do
        puts "[END]"
    end

    test "should refresh token" do
        post '/login', params: @user.slice(:email, :username, :password)
        token = @response.parsed_body['token']
        sleep(2)  # Wait for 2 seconds before refreshing to avoid same token.
        get '/refreshToken', headers: { "Authorization" => "Bearer " + token }
        new_token = @response.parsed_body['token']
        assert_response :ok
        assert_not_equal token, new_token
    end

    test "should not refresh token without token" do
        post '/login', params: @user.slice(:email, :username, :password)
        get '/refreshToken'
        assert_response :unauthorized
    end

    test "should not refresh token with invalid token" do
        post '/login', params: @user.slice(:email, :username, :password)
        get '/refreshToken', headers: { "Authorization" => "Bearer " + "invalid_token" }
        assert_response :unauthorized
    end
end