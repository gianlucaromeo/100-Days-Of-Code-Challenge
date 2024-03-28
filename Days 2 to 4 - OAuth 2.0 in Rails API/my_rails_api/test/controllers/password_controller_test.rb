require "test_helper"

class PasswordControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = {
      "email": "test_email@test.it",
      "username": "test_username",
      "password": "test_password",
    }
    User.create(@user)
    puts "\n[START]"
  end

  teardown do
    puts "[END]"
  end

  test "should post password forgotten" do
    post "/passwordForgotten", params: @user.slice(:email)
    assert_response :ok  # 200
  end

  test "should not post password forgotten without email" do
    post "/passwordForgotten", params: {}  # Missing email
    assert_response :unprocessable_entity
  end

  test "should not post password forgotten with invalid email" do
    post "/passwordForgotten", params: { email: "invalid_email_test@test.it" }
    assert_response :not_found
  end

  test "should post reset password" do
    post "/passwordForgotten", params: @user.slice(:email)
    user = User.find_by(email: @user[:email])
    post "/resetPassword", params: {
      password_reset_token: user.password_reset_token,
      new_password: "new_password",
      new_password_confirmation: "new_password",
    }
    assert_response :ok  # 200
  end

  test "should not post reset password without password reset token" do
    post "/passwordForgotten", params: @user.slice(:email)
    # user = User.find_by(email: @user[:email])
    post "/resetPassword", params: {
      new_password: "new_password",
      new_password_confirmation: "new_password",
    }
    assert_response :unprocessable_entity
  end

  test "should not post reset password without previously password forgotten" do
    post "/resetPassword", params: {
      password_reset_token: "password_reset_token",
      new_password: "new_password",
      new_password_confirmation: "new_password",
    }
    assert_response :not_found
  end

  test "should not post reset password with expired password reset token" do
    post "/passwordForgotten", params: @user.slice(:email)
    user = User.find_by(email: @user[:email])
    user.update!(password_reset_sent_at: 3.hours.ago)
    post "/resetPassword", params: {
      password_reset_token: user.password_reset_token,
      new_password: "new_password",
      new_password_confirmation: "new_password",
    }
    assert_response :unprocessable_entity
  end

  test "should not post reset password with different passwords" do
    post "/passwordForgotten", params: @user.slice(:email)
    user = User.find_by(email: @user[:email])
    post "/resetPassword", params: {
      password_reset_token: user.password_reset_token,
      new_password: "new_password",
      new_password_confirmation: "different_password",
    }
    assert_response :unprocessable_entity
  end

  test "should not post reset password with invalid password reset token" do
    post "/passwordForgotten", params: @user.slice(:email)
    user = User.find_by(email: @user[:email])
    post "/resetPassword", params: {
      password_reset_token: "invalid",
      new_password: "new_password",
      new_password_confirmation: "new_password",
    }
    assert_response :not_found
  end

end
