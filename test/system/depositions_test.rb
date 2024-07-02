require "application_system_test_case"

class DepositionsTest < ApplicationSystemTestCase
  setup do
    @deposition = depositions(:one)
  end

  test "visiting the index" do
    visit depositions_url
    assert_selector "h1", text: "Depositions"
  end

  test "should create deposition" do
    visit depositions_url
    click_on "New deposition"

    click_on "Create Deposition"

    assert_text "Deposition was successfully created"
    click_on "Back"
  end

  test "should update Deposition" do
    visit deposition_url(@deposition)
    click_on "Edit this deposition", match: :first

    click_on "Update Deposition"

    assert_text "Deposition was successfully updated"
    click_on "Back"
  end

  test "should destroy Deposition" do
    visit deposition_url(@deposition)
    click_on "Destroy this deposition", match: :first

    assert_text "Deposition was successfully destroyed"
  end
end
