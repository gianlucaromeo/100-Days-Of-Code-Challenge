require "test_helper"

class LoginControllerTest < ActionDispatch::IntegrationTest
    setup do
        @user = {
            "email": "test@test.it",
            "username": "test_username",
            "password": "test_password"
        }
        User.create!(@user)
        puts "\n[START]"
    end

    teardown do
        puts "[END]"
    end

    test "should login with email only" do
        post "/login", params: @user.slice(:email, :password)
        assert_response :accepted
    end

    test "should login with username only" do
        post "/login", params: @user.slice(:username, :password)
        assert_response :accepted
    end

    test "should not login without email or username" do
        post "/login", params: @user.slice(:password)
        assert_response :unauthorized
    end

    test "should not login with invalid email" do
        post "/login", params: {
            "email": "wrong_email@test.it",
            "password": @user[:password]
        }
        assert_response :not_found
    end

    test "should not login with invalid username" do
        post "/login", params: {
            "username": "wrong_username",
            "password": @user[:password]
        }
        assert_response :not_found
    end

    test "should not login with invalid password and email only" do
        post "/login", params: {
            "email": @user[:email],
            "password": "wrong_password"
        }
        assert_response :unauthorized
    end

    test "should not login with invalid password and username only" do
        post "/login", params: {
            "username": @user[:username],
            "password": "wrong_password"
        }
        assert_response :unauthorized
    end

    test "should not login without password and email only" do
        post "/login", params: @user.slice(:email)
        assert_response :unauthorized
    end

    test "should not login without password and username only" do
        post "/login", params: @user.slice(:username)
        assert_response :unauthorized
    end
end
