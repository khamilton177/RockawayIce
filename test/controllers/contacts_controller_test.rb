require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get subscribe" do
    get contacts_subscribe_url
    assert_response :success
  end

end
