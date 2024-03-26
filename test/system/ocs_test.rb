require "application_system_test_case"

class OcsTest < ApplicationSystemTestCase
  setup do
    @oc = ocs(:one)
  end

  test "visiting the index" do
    visit ocs_url
    assert_selector "h1", text: "Ocs"
  end

  test "should create oc" do
    visit ocs_url
    click_on "New oc"

    fill_in "Address", with: @oc.address
    fill_in "Email", with: @oc.email
    fill_in "Fname", with: @oc.fname
    fill_in "Full name", with: @oc.full_name
    fill_in "Lawsuit", with: @oc.lawsuit_id
    fill_in "Phone", with: @oc.phone
    fill_in "Sbn", with: @oc.sbn
    fill_in "Website", with: @oc.website
    click_on "Create Oc"

    assert_text "Oc was successfully created"
    click_on "Back"
  end

  test "should update Oc" do
    visit oc_url(@oc)
    click_on "Edit this oc", match: :first

    fill_in "Address", with: @oc.address
    fill_in "Email", with: @oc.email
    fill_in "Fname", with: @oc.fname
    fill_in "Full name", with: @oc.full_name
    fill_in "Lawsuit", with: @oc.lawsuit_id
    fill_in "Phone", with: @oc.phone
    fill_in "Sbn", with: @oc.sbn
    fill_in "Website", with: @oc.website
    click_on "Update Oc"

    assert_text "Oc was successfully updated"
    click_on "Back"
  end

  test "should destroy Oc" do
    visit oc_url(@oc)
    click_on "Destroy this oc", match: :first

    assert_text "Oc was successfully destroyed"
  end
end
