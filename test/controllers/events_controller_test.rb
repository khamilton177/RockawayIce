require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get event_form" do
    get events_event_form_url
    assert_response :success
  end

end
