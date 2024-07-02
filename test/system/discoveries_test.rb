require "application_system_test_case"

class DiscoveriesTest < ApplicationSystemTestCase
  setup do
    @discovery = discoveries(:one)
  end

  test "visiting the index" do
    visit discoveries_url
    assert_selector "h1", text: "Discoveries"
  end

  test "should create discovery" do
    visit discoveries_url
    click_on "New discovery"

    click_on "Create Discovery"

    assert_text "Discovery was successfully created"
    click_on "Back"
  end

  test "should update Discovery" do
    visit discovery_url(@discovery)
    click_on "Edit this discovery", match: :first

    click_on "Update Discovery"

    assert_text "Discovery was successfully updated"
    click_on "Back"
  end

  test "should destroy Discovery" do
    visit discovery_url(@discovery)
    click_on "Destroy this discovery", match: :first

    assert_text "Discovery was successfully destroyed"
  end
end
