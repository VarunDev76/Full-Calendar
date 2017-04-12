require 'test_helper'

class GoogleDataControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get google_data_index_url
    assert_response :success
  end

  test "should get show" do
    get google_data_show_url
    assert_response :success
  end

  test "should get new" do
    get google_data_new_url
    assert_response :success
  end

  test "should get destroy" do
    get google_data_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get google_data_edit_url
    assert_response :success
  end

end
