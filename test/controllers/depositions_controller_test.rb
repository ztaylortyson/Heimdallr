require "test_helper"

class DepositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deposition = depositions(:one)
  end

  test "should get index" do
    get depositions_url
    assert_response :success
  end

  test "should get new" do
    get new_deposition_url
    assert_response :success
  end

  test "should create deposition" do
    assert_difference("Deposition.count") do
      post depositions_url, params: { deposition: {  } }
    end

    assert_redirected_to deposition_url(Deposition.last)
  end

  test "should show deposition" do
    get deposition_url(@deposition)
    assert_response :success
  end

  test "should get edit" do
    get edit_deposition_url(@deposition)
    assert_response :success
  end

  test "should update deposition" do
    patch deposition_url(@deposition), params: { deposition: {  } }
    assert_redirected_to deposition_url(@deposition)
  end

  test "should destroy deposition" do
    assert_difference("Deposition.count", -1) do
      delete deposition_url(@deposition)
    end

    assert_redirected_to depositions_url
  end
end
