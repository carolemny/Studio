require 'test_helper'

class AvatarControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get avatar_create_url
    assert_response :success
  end

end
