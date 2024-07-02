require "test_helper"

class LcourtdatesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get lcourtdates_edit_url
    assert_response :success
  end
end
