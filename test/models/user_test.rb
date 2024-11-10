require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new username: "abc", email: "info@shadowcrafter.org", password: "PlaceholderPassword1", password_confirmation: "PlaceholderPassword1"
  end

  test "user is valid" do
    assert @user.valid?
  end

  test "users with invalid usernames are not valid" do
    @user.username = "abc."
    assert_not @user.valid?

    @user.username = "ab"
    assert_not @user.valid?
  end

  test "password need to match" do
    @user.password_confirmation = "Placeholder"
    assert_not @user.valid?
  end

  test "password is matched correctly" do
    assert @user.valid_password? "PlaceholderPassword1"
  end

  test "user must have unique username" do
    @user.username = "one"
    assert_not @user.valid?
  end

  test "user must have unique email" do
    @user.email = "email1@shadowcrafter.org"
    assert_not @user.valid?
  end

  test "user must have valid email" do
    @user.email = "email"
    assert_not @user.valid?
  end

  test "user should have user role" do
    assert_equal "user", @user.role
  end
end
