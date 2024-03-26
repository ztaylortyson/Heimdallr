require "test_helper"

class OcsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oc = ocs(:one)
  end

  test "should get index" do
    get ocs_url
    assert_response :success
  end

  test "should get new" do
    get new_oc_url
    assert_response :success
  end

  test "should create oc" do
    assert_difference("Oc.count") do
      post ocs_url, params: { oc: { address: @oc.address, email: @oc.email, fname: @oc.fname, full_name: @oc.full_name, lawsuit_id: @oc.lawsuit_id, phone: @oc.phone, sbn: @oc.sbn, website: @oc.website } }
    end

    assert_redirected_to oc_url(Oc.last)
  end

  test "should show oc" do
    get oc_url(@oc)
    assert_response :success
  end

  test "should get edit" do
    get edit_oc_url(@oc)
    assert_response :success
  end

  test "should update oc" do
    patch oc_url(@oc), params: { oc: { address: @oc.address, email: @oc.email, fname: @oc.fname, full_name: @oc.full_name, lawsuit_id: @oc.lawsuit_id, phone: @oc.phone, sbn: @oc.sbn, website: @oc.website } }
    assert_redirected_to oc_url(@oc)
  end

  test "should destroy oc" do
    assert_difference("Oc.count", -1) do
      delete oc_url(@oc)
    end

    assert_redirected_to ocs_url
  end
end
