require "test_helper"

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get clients_url
    assert_response :success
  end

  test "should get new" do
    get new_client_url
    assert_response :success
  end

  test "should create client" do
    assert_difference("Client.count") do
      post clients_url, params: { client: { address: @client.address, city: @client.city, commissions: @client.commissions, dob: @client.dob, doh: @client.doh, dot: @client.dot, email: @client.email, emergency_contact: @client.emergency_contact, emergency_phone: @client.emergency_phone, exempt: @client.exempt, fname: @client.fname, gender: @client.gender, job_title: @client.job_title, lname: @client.lname, married: @client.married, mname: @client.mname, pay_rate: @client.pay_rate, pay_type: @client.pay_type, phone: @client.phone, ssn: @client.ssn, state: @client.state, summary: @client.summary, work_email: @client.work_email, zip: @client.zip } }
    end

    assert_redirected_to client_url(Client.last)
  end

  test "should show client" do
    get client_url(@client)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_url(@client)
    assert_response :success
  end

  test "should update client" do
    patch client_url(@client), params: { client: { address: @client.address, city: @client.city, commissions: @client.commissions, dob: @client.dob, doh: @client.doh, dot: @client.dot, email: @client.email, emergency_contact: @client.emergency_contact, emergency_phone: @client.emergency_phone, exempt: @client.exempt, fname: @client.fname, gender: @client.gender, job_title: @client.job_title, lname: @client.lname, married: @client.married, mname: @client.mname, pay_rate: @client.pay_rate, pay_type: @client.pay_type, phone: @client.phone, ssn: @client.ssn, state: @client.state, summary: @client.summary, work_email: @client.work_email, zip: @client.zip } }
    assert_redirected_to client_url(@client)
  end

  test "should destroy client" do
    assert_difference("Client.count", -1) do
      delete client_url(@client)
    end

    assert_redirected_to clients_url
  end
end
