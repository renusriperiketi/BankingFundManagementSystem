require "test_helper"

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_index_url
    assert_response :success
  end

  test "should get new" do
    get admins_new_url
    assert_response :success
  end

  test "should get signin" do
    get admins_signin_url
    assert_response :success
  end
end
