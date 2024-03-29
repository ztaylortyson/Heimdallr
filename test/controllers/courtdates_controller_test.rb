require "test_helper"

class CourtdatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @courtdate = courtdates(:one)
  end

  test "should get index" do
    get courtdates_url
    assert_response :success
  end

  test "should get new" do
    get new_courtdate_url
    assert_response :success
  end

  test "should create courtdate" do
    assert_difference("Courtdate.count") do
      post courtdates_url, params: { courtdate: { answer: @courtdate.answer, cmc: @courtdate.cmc, complaint: @courtdate.complaint, discovery_cutoff: @courtdate.discovery_cutoff, first_expert_exchange: @courtdate.first_expert_exchange, lawsuit_id: @courtdate.lawsuit_id, old_answer: @courtdate.old_answer, old_cmc: @courtdate.old_cmc, old_complaint: @courtdate.old_complaint, old_discovery_cutoff: @courtdate.old_discovery_cutoff, old_paga: @courtdate.old_paga, old_trc: @courtdate.old_trc, old_trial: @courtdate.old_trial, paga: @courtdate.paga, second_expert_exchange: @courtdate.second_expert_exchange, trc: @courtdate.trc, trial: @courtdate.trial } }
    end

    assert_redirected_to courtdate_url(Courtdate.last)
  end

  test "should show courtdate" do
    get courtdate_url(@courtdate)
    assert_response :success
  end

  test "should get edit" do
    get edit_courtdate_url(@courtdate)
    assert_response :success
  end

  test "should update courtdate" do
    patch courtdate_url(@courtdate), params: { courtdate: { answer: @courtdate.answer, cmc: @courtdate.cmc, complaint: @courtdate.complaint, discovery_cutoff: @courtdate.discovery_cutoff, first_expert_exchange: @courtdate.first_expert_exchange, lawsuit_id: @courtdate.lawsuit_id, old_answer: @courtdate.old_answer, old_cmc: @courtdate.old_cmc, old_complaint: @courtdate.old_complaint, old_discovery_cutoff: @courtdate.old_discovery_cutoff, old_paga: @courtdate.old_paga, old_trc: @courtdate.old_trc, old_trial: @courtdate.old_trial, paga: @courtdate.paga, second_expert_exchange: @courtdate.second_expert_exchange, trc: @courtdate.trc, trial: @courtdate.trial } }
    assert_redirected_to courtdate_url(@courtdate)
  end

  test "should destroy courtdate" do
    assert_difference("Courtdate.count", -1) do
      delete courtdate_url(@courtdate)
    end

    assert_redirected_to courtdates_url
  end
end
