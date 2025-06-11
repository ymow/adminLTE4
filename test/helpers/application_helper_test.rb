require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  include ApplicationHelper

  test "link_to_active adds active class when on current page" do
    # Mock current_page? to return true
    def current_page?(options)
      options[:path] == "/test" && options[:status_category_type] == "active"
    end

    # Mock url_for to return a test URL
    def url_for(options)
      "/test"
    end

    # Mock params to return test parameters
    def params
      { status_category_type: "active" }
    end

    result = link_to_active("Test Link", "/test", { class: "nav-link" })
    
    assert_includes result, 'class="nav-link active"'
    assert_includes result, "Test Link"
  end

  test "link_to_active does not add active class when not on current page" do
    # Mock current_page? to return false
    def current_page?(options)
      false
    end

    # Mock url_for to return a test URL
    def url_for(options)
      "/other"
    end

    # Mock params to return test parameters
    def params
      { status_category_type: "inactive" }
    end

    result = link_to_active("Test Link", "/other", { class: "nav-link" })
    
    assert_includes result, 'class="nav-link"'
    assert_not_includes result, "active"
    assert_includes result, "Test Link"
  end

  test "link_to_active works with no existing class" do
    # Mock current_page? to return true
    def current_page?(options)
      options[:path] == "/test"
    end

    # Mock url_for to return a test URL
    def url_for(options)
      "/test"
    end

    # Mock params to return empty parameters
    def params
      {}
    end

    result = link_to_active("Test Link", "/test")
    
    assert_includes result, 'class="active"'
    assert_includes result, "Test Link"
  end

  test "link_to_active preserves existing classes when adding active" do
    # Mock current_page? to return true
    def current_page?(options)
      options[:path] == "/test"
    end

    # Mock url_for to return a test URL
    def url_for(options)
      "/test"
    end

    # Mock params to return empty parameters
    def params
      {}
    end

    result = link_to_active("Test Link", "/test", { class: ["nav-link", "btn"] })
    
    assert_includes result, 'class="nav-link btn active"'
    assert_includes result, "Test Link"
  end
end