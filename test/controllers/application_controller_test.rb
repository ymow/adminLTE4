require "test_helper"

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test "application controller inherits from ActionController::Base" do
    assert ApplicationController < ActionController::Base
  end

  test "application controller includes necessary modules" do
    # Test that the controller has the expected behavior
    assert_respond_to ApplicationController, :new
    assert ApplicationController.included_modules.include?(ActionController::RequestForgeryProtection)
  end
end