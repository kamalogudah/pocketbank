require 'test_helper'

class LandingControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get landing_welcome_url
    assert_response :success
  end

end
