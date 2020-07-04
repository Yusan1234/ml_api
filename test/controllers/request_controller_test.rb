require 'test_helper'

class RequestControllerTest < ActionDispatch::IntegrationTest
  test "should get connection" do
    get request_connection_url
    assert_response :success
  end

end
