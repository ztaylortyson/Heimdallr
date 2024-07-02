require "test_helper"

class DevControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get dev_home_url
    assert_response :success
  end

  test "should get pns" do
    get dev_pns_url
    assert_response :success
  end

  test "should get roa" do
    get dev_roa_url
    assert_response :success
  end
end
