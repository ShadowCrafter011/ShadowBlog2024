require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get new" do
    get new_user_registration_path
    assert_response :success
  end

  test "should get login" do
    get new_user_session_path
    assert_response :success
  end

  test "should create new user" do
    post user_registration_path, params: { user: { username: "abc", email: "abc@shadowcrafter.org", password: "PlaceholderPassword1", password_confirmation: "PlaceholderPassword1" } }
    assert_response :redirect
  end

  test "should not get edit when logged out" do
    get edit_user_registration_path
    assert_response :redirect
  end

  test "should get edit" do
    sign_in users(:two)

    get edit_user_registration_path
    assert_response :success
  end

  test "should not update without password" do
    sign_in users(:two)

    patch user_registration_path, params: { user: { username: "twoupdated" } }
    assert_response :unprocessable_entity
  end

  test "should not update with invalid password" do
    sign_in users(:two)

    patch user_registration_path, params: { user: { username: "twoupdated", current_password: "Placeholder1" } }
    assert_response :unprocessable_entity
  end

  test "should not update invalid username" do
    sign_in users(:two)

    patch user_registration_path, params: { user: { username: "ab", current_password: "PlaceholderPassword1" } }
    assert_response :unprocessable_entity
  end

  test "update username" do
    sign_in users(:two)

    patch user_registration_path, params: { user: { username: "twoupdated", current_password: "PlaceholderPassword1" } }
    assert_response :redirect
  end

  test "update password" do
    sign_in users(:two)

    patch user_registration_path, params: { user: { password: "Placeholder1", password_confirmation: "Placeholder1", current_password: "PlaceholderPassword1" } }
    assert_response :redirect
  end

  test "unconfirmed user can not log in" do
    post user_session_path, params: { user: { email: "created@shadowcrafter.org", password: "PlaceholderPassword1" } }
    assert_response :unprocessable_entity
  end

  test "user can log in" do
    post user_session_path, params: { user: { email: "confirmed@shadowcrafter.org", password: "PlaceholderPassword1" } }
    assert_response :redirect
  end

  test "user can logout" do
    delete destroy_user_session_path
    assert_response :redirect
  end

  test "should destroy user" do
    sign_in users(:two)

    assert_difference "User.count", -1 do
      delete user_registration_path
    end
  end
end
