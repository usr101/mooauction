require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase

	def setup
    inject_logon_in_session
  end

  test "should get edit_password" do
    get :edit_password
    assert_response :success
  end

  test "should get update_password" do
    get :update_password, change_password_form: {current_password: 'password', new_password: 'password2', confirm_password: 'password2' } 
    assert_response :success
  end

end
