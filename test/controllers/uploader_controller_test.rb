require 'test_helper'

class UploaderControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get uploader_create_url
    assert_response :success
  end

end
