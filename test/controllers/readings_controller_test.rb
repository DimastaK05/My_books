require "test_helper"

class ReadingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get readings_new_url
    assert_response :success
  end

  test "should get create" do
    get readings_create_url
    assert_response :success
  end

  test "should get edit" do
    get readings_edit_url
    assert_response :success
  end

  test "should get update" do
    get readings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get readings_destroy_url
    assert_response :success
  end
end
