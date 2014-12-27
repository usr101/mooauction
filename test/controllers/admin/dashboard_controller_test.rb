require 'test_helper'

class Admin::DashboardControllerTest < ActionController::TestCase

	def setup
		inject_logon_in_session
	end

  test "should get index" do
    get :index
    assert_response :success
  end

end
