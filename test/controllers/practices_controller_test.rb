require "test_helper"

class PracticesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get practices_new_url
    assert_response :success
  end

  test "should get show" do
    get practices_show_url
    assert_response :success
  end

  test "should get edit" do
    get practices_edit_url
    assert_response :success
  end

  test "should get delete" do
    get practices_delete_url
    assert_response :success
  end
end
