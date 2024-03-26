require "application_system_test_case"

class LawsuitsTest < ApplicationSystemTestCase
  setup do
    @lawsuit = lawsuits(:one)
  end

  test "visiting the index" do
    visit lawsuits_url
    assert_selector "h1", text: "Lawsuits"
  end

  test "should create lawsuit" do
    visit lawsuits_url
    click_on "New lawsuit"

    fill_in "Atty for", with: @lawsuit.atty_for
    fill_in "Cn", with: @lawsuit.cn
    fill_in "Ct", with: @lawsuit.ct
    fill_in "Def caption", with: @lawsuit.def_caption
    fill_in "Dept", with: @lawsuit.dept
    fill_in "Forum", with: @lawsuit.forum
    fill_in "Judge", with: @lawsuit.judge
    fill_in "Location", with: @lawsuit.location
    fill_in "Lroa", with: @lawsuit.lroa
    fill_in "Old judge", with: @lawsuit.old_judge
    fill_in "Plt caption", with: @lawsuit.plt_caption
    fill_in "Stage", with: @lawsuit.stage
    fill_in "Status", with: @lawsuit.status
    fill_in "User", with: @lawsuit.user_id
    click_on "Create Lawsuit"

    assert_text "Lawsuit was successfully created"
    click_on "Back"
  end

  test "should update Lawsuit" do
    visit lawsuit_url(@lawsuit)
    click_on "Edit this lawsuit", match: :first

    fill_in "Atty for", with: @lawsuit.atty_for
    fill_in "Cn", with: @lawsuit.cn
    fill_in "Ct", with: @lawsuit.ct
    fill_in "Def caption", with: @lawsuit.def_caption
    fill_in "Dept", with: @lawsuit.dept
    fill_in "Forum", with: @lawsuit.forum
    fill_in "Judge", with: @lawsuit.judge
    fill_in "Location", with: @lawsuit.location
    fill_in "Lroa", with: @lawsuit.lroa
    fill_in "Old judge", with: @lawsuit.old_judge
    fill_in "Plt caption", with: @lawsuit.plt_caption
    fill_in "Stage", with: @lawsuit.stage
    fill_in "Status", with: @lawsuit.status
    fill_in "User", with: @lawsuit.user_id
    click_on "Update Lawsuit"

    assert_text "Lawsuit was successfully updated"
    click_on "Back"
  end

  test "should destroy Lawsuit" do
    visit lawsuit_url(@lawsuit)
    click_on "Destroy this lawsuit", match: :first

    assert_text "Lawsuit was successfully destroyed"
  end
end
