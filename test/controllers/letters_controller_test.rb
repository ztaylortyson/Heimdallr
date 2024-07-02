require "test_helper"

class LettersControllerTest < ActionDispatch::IntegrationTest
  test "should get rpf" do
    get letters_rpf_url
    assert_response :success
  end

  test "should get edd" do
    get letters_edd_url
    assert_response :success
  end
end
