require "test_helper"

class InitiateNcControllerTest < ActionDispatch::IntegrationTest
  test "should get intake" do
    get initiate_nc_intake_url
    assert_response :success
  end
end
