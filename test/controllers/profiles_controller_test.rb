require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get edit_password" do
    get :edit_password
    assert_response :success
  end

  test "should get update_password" do
    get :update_password
    assert_response :success
  end

end
