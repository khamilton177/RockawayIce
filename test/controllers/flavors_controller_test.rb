require 'test_helper'

class FlavorsControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get flavors_about_url
    assert_response :success
  end

  test "should get flavor_friday_form" do
    get flavors_flavor_friday_form_url
    assert_response :success
  end

  test "should get flavor_faves" do
    get flavors_flavor_faves_url
    assert_response :success
  end

end
