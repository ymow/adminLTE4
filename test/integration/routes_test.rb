require "test_helper"

class RoutesTest < ActionDispatch::IntegrationTest
  test "root route points to pages#index" do
    assert_routing "/", controller: "pages", action: "index"
  end

  test "health check route is properly configured" do
    assert_routing "/up", controller: "rails/health", action: "show"
  end

  test "root path helper works correctly" do
    assert_equal "/", root_path
  end

  test "rails health check path helper works correctly" do
    assert_equal "/up", rails_health_check_path
  end
end