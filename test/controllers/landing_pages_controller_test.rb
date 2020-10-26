require 'test_helper'

class LandingPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get landing_pages_welcome_url
    assert_response :success
  end

end
