require "application_system_test_case"

class ResponsesTest < ApplicationSystemTestCase
  setup do
    @response = responses(:one)
  end

  test "visiting the index" do
    visit responses_url
    assert_selector "h1", text: "Responses"
  end

  test "should create response" do
    visit responses_url
    click_on "New response"

    fill_in "Discovery set", with: @response.discovery_set
    fill_in "Discovery type", with: @response.discovery_type
    fill_in "Group", with: @response.group
    fill_in "Lawsuit", with: @response.lawsuit_id
    fill_in "Propounding party", with: @response.propounding_party
    fill_in "Responding party", with: @response.responding_party
    click_on "Create Response"

    assert_text "Response was successfully created"
    click_on "Back"
  end

  test "should update Response" do
    visit response_url(@response)
    click_on "Edit this response", match: :first

    fill_in "Discovery set", with: @response.discovery_set
    fill_in "Discovery type", with: @response.discovery_type
    fill_in "Group", with: @response.group
    fill_in "Lawsuit", with: @response.lawsuit_id
    fill_in "Propounding party", with: @response.propounding_party
    fill_in "Responding party", with: @response.responding_party
    click_on "Update Response"

    assert_text "Response was successfully updated"
    click_on "Back"
  end

  test "should destroy Response" do
    visit response_url(@response)
    click_on "Destroy this response", match: :first

    assert_text "Response was successfully destroyed"
  end
end
