require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:one)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clients"
  end

  test "should create client" do
    visit clients_url
    click_on "New client"

    fill_in "Address", with: @client.address
    fill_in "City", with: @client.city
    check "Commissions" if @client.commissions
    fill_in "Dob", with: @client.dob
    fill_in "Doh", with: @client.doh
    fill_in "Dot", with: @client.dot
    fill_in "Email", with: @client.email
    fill_in "Emergency contact", with: @client.emergency_contact
    fill_in "Emergency phone", with: @client.emergency_phone
    check "Exempt" if @client.exempt
    fill_in "Fname", with: @client.fname
    fill_in "Gender", with: @client.gender
    fill_in "Job title", with: @client.job_title
    fill_in "Lname", with: @client.lname
    check "Married" if @client.married
    fill_in "Mname", with: @client.mname
    fill_in "Pay rate", with: @client.pay_rate
    fill_in "Pay type", with: @client.pay_type
    fill_in "Phone", with: @client.phone
    fill_in "Ssn", with: @client.ssn
    fill_in "State", with: @client.state
    fill_in "Summary", with: @client.summary
    fill_in "Work email", with: @client.work_email
    fill_in "Zip", with: @client.zip
    click_on "Create Client"

    assert_text "Client was successfully created"
    click_on "Back"
  end

  test "should update Client" do
    visit client_url(@client)
    click_on "Edit this client", match: :first

    fill_in "Address", with: @client.address
    fill_in "City", with: @client.city
    check "Commissions" if @client.commissions
    fill_in "Dob", with: @client.dob
    fill_in "Doh", with: @client.doh
    fill_in "Dot", with: @client.dot
    fill_in "Email", with: @client.email
    fill_in "Emergency contact", with: @client.emergency_contact
    fill_in "Emergency phone", with: @client.emergency_phone
    check "Exempt" if @client.exempt
    fill_in "Fname", with: @client.fname
    fill_in "Gender", with: @client.gender
    fill_in "Job title", with: @client.job_title
    fill_in "Lname", with: @client.lname
    check "Married" if @client.married
    fill_in "Mname", with: @client.mname
    fill_in "Pay rate", with: @client.pay_rate
    fill_in "Pay type", with: @client.pay_type
    fill_in "Phone", with: @client.phone
    fill_in "Ssn", with: @client.ssn
    fill_in "State", with: @client.state
    fill_in "Summary", with: @client.summary
    fill_in "Work email", with: @client.work_email
    fill_in "Zip", with: @client.zip
    click_on "Update Client"

    assert_text "Client was successfully updated"
    click_on "Back"
  end

  test "should destroy Client" do
    visit client_url(@client)
    click_on "Destroy this client", match: :first

    assert_text "Client was successfully destroyed"
  end
end
