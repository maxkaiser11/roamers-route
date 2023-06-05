require "test_helper"

class HomepageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get homepage_show_url
    assert_response :success
  end
end
