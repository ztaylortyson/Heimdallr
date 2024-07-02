require "test_helper"

class ScrapersControllerTest < ActionDispatch::IntegrationTest
  test "should get sbn" do
    get scrapers_sbn_url
    assert_response :success
  end

  test "should get roa" do
    get scrapers_roa_url
    assert_response :success
  end

  test "should get pns" do
    get scrapers_pns_url
    assert_response :success
  end

  test "should get ncf" do
    get scrapers_ncf_url
    assert_response :success
  end

  test "should get tr" do
    get scrapers_tr_url
    assert_response :success
  end
end
