require "test_helper"

class HotelappsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hotelapps_index_url
    assert_response :success
  end

  test "should get show" do
    get hotelapps_show_url
    assert_response :success
  end

  test "should get new" do
    get hotelapps_new_url
    assert_response :success
  end

  test "should get create" do
    get hotelapps_create_url
    assert_response :success
  end

  test "should get edit" do
    get hotelapps_edit_url
    assert_response :success
  end

  test "should get update" do
    get hotelapps_update_url
    assert_response :success
  end

  test "should get destroy" do
    get hotelapps_destroy_url
    assert_response :success
  end
end
