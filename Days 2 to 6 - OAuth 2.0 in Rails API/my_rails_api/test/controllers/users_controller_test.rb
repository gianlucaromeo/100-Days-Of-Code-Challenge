require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
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

  test "should get me" do
    post "/login", params: @user.slice(:email, :password)
    token = JSON.parse(@response.body)["token"]
    get "/me", headers: { "Authorization" => "Bearer " + token }
    assert_response :ok
  end

  # TODO: Add more tests
  # - should not get me without token
  # - should not get me with invalid token
  # - should not get me with expired token
  # - should not get me with invalid token format
  # - should not get me with invalid token type
end
