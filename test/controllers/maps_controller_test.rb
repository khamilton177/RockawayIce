require 'test_helper'

class MapsControllerTest < ActionDispatch::IntegrationTest
  test "should get wheres_cart" do
    get maps_wheres_cart_url
    assert_response :success
  end

end
