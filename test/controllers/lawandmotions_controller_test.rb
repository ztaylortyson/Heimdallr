require "test_helper"

class LawandmotionsControllerTest < ActionDispatch::IntegrationTest
  test "should get separate_statement" do
    get lawandmotions_separate_statement_url
    assert_response :success
  end

  test "should get proposed_order" do
    get lawandmotions_proposed_order_url
    assert_response :success
  end

  test "should get notice_of_motion" do
    get lawandmotions_notice_of_motion_url
    assert_response :success
  end

  test "should get memo_panda" do
    get lawandmotions_memo_panda_url
    assert_response :success
  end
end
