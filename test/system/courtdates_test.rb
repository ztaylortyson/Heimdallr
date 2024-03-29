require "application_system_test_case"

class CourtdatesTest < ApplicationSystemTestCase
  setup do
    @courtdate = courtdates(:one)
  end

  test "visiting the index" do
    visit courtdates_url
    assert_selector "h1", text: "Courtdates"
  end

  test "should create courtdate" do
    visit courtdates_url
    click_on "New courtdate"

    fill_in "Answer", with: @courtdate.answer
    fill_in "Cmc", with: @courtdate.cmc
    fill_in "Complaint", with: @courtdate.complaint
    fill_in "Discovery cutoff", with: @courtdate.discovery_cutoff
    fill_in "First expert exchange", with: @courtdate.first_expert_exchange
    fill_in "Lawsuit", with: @courtdate.lawsuit_id
    fill_in "Old answer", with: @courtdate.old_answer
    fill_in "Old cmc", with: @courtdate.old_cmc
    fill_in "Old complaint", with: @courtdate.old_complaint
    fill_in "Old discovery cutoff", with: @courtdate.old_discovery_cutoff
    fill_in "Old paga", with: @courtdate.old_paga
    fill_in "Old trc", with: @courtdate.old_trc
    fill_in "Old trial", with: @courtdate.old_trial
    fill_in "Paga", with: @courtdate.paga
    fill_in "Second expert exchange", with: @courtdate.second_expert_exchange
    fill_in "Trc", with: @courtdate.trc
    fill_in "Trial", with: @courtdate.trial
    click_on "Create Courtdate"

    assert_text "Courtdate was successfully created"
    click_on "Back"
  end

  test "should update Courtdate" do
    visit courtdate_url(@courtdate)
    click_on "Edit this courtdate", match: :first

    fill_in "Answer", with: @courtdate.answer
    fill_in "Cmc", with: @courtdate.cmc
    fill_in "Complaint", with: @courtdate.complaint
    fill_in "Discovery cutoff", with: @courtdate.discovery_cutoff
    fill_in "First expert exchange", with: @courtdate.first_expert_exchange
    fill_in "Lawsuit", with: @courtdate.lawsuit_id
    fill_in "Old answer", with: @courtdate.old_answer
    fill_in "Old cmc", with: @courtdate.old_cmc
    fill_in "Old complaint", with: @courtdate.old_complaint
    fill_in "Old discovery cutoff", with: @courtdate.old_discovery_cutoff
    fill_in "Old paga", with: @courtdate.old_paga
    fill_in "Old trc", with: @courtdate.old_trc
    fill_in "Old trial", with: @courtdate.old_trial
    fill_in "Paga", with: @courtdate.paga
    fill_in "Second expert exchange", with: @courtdate.second_expert_exchange
    fill_in "Trc", with: @courtdate.trc
    fill_in "Trial", with: @courtdate.trial
    click_on "Update Courtdate"

    assert_text "Courtdate was successfully updated"
    click_on "Back"
  end

  test "should destroy Courtdate" do
    visit courtdate_url(@courtdate)
    click_on "Destroy this courtdate", match: :first

    assert_text "Courtdate was successfully destroyed"
  end
end
