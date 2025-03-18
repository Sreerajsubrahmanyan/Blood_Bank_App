require "test_helper"

class BloodRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get blood_requests_new_url
    assert_response :success
  end

  test "should get create" do
    get blood_requests_create_url
    assert_response :success
  end

  test "should get index" do
    get blood_requests_index_url
    assert_response :success
  end

  test "should get update" do
    get blood_requests_update_url
    assert_response :success
  end
end
