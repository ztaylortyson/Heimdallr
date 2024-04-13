require "test_helper"

class PleadingsControllerTest < ActionDispatch::IntegrationTest
  test "should get generic" do
    get pleadings_generic_url
    assert_response :success
  end

  test "should get memo_panda" do
    get pleadings_memo_panda_url
    assert_response :success
  end

  test "should get notice_of_motion" do
    get pleadings_notice_of_motion_url
    assert_response :success
  end

  test "should get atty_decl" do
    get pleadings_atty_decl_url
    assert_response :success
  end
end
