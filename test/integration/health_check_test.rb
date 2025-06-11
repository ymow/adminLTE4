require "test_helper"

class HealthCheckTest < ActionDispatch::IntegrationTest
  test "health check endpoint returns success" do
    get rails_health_check_path
    assert_response :success
  end

  test "health check endpoint returns OK status" do
    get rails_health_check_path
    assert_equal "text/html", response.media_type
    assert_response :success
  end
end