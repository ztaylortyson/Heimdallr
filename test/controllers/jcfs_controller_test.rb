require "test_helper"

class JcfsControllerTest < ActionDispatch::IntegrationTest
  test "should get pes" do
    get jcfs_pes_url
    assert_response :success
  end
end
