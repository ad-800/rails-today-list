require "test_helper"

class UpdatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get updates_index_url
    assert_response :success
  end

  test "should get create" do
    get updates_create_url
    assert_response :success
  end

  test "should get show" do
    get updates_show_url
    assert_response :success
  end
end
