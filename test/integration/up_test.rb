require "test_helper"

class UpTest < ActionDispatch::IntegrationTest
  test "rails is up and healthy" do
    get rails_health_check_path
    assert_response :success
  end
end
