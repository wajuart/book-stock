require 'test_helper'

class StatusesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get statuses_create_url
    assert_response :success
  end

end
