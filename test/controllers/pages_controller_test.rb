require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
  end

  test "index should render the correct template" do
    get root_path
    assert_template :index
  end

  test "index should have correct content type" do
    get root_path
    assert_equal "text/html", response.media_type
  end

  test "index should contain expected content" do
    get root_path
    assert_select "h3", "Fixed Layout"
    assert_select ".card-title", "Title"
    assert_select ".card-body", text: /Start creating your amazing application!/
    assert_select ".breadcrumb-item.active", "Fixed Layout"
  end

  test "index should have proper HTML structure" do
    get root_path
    assert_select ".app-content-header"
    assert_select ".app-content"
    assert_select ".card"
    assert_select ".card-header"
    assert_select ".card-body"
    assert_select ".card-footer"
  end
end