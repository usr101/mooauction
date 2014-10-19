require 'test_helper'

class AuctionsControllerTest < ActionController::TestCase
  
  test "should have index" do
     get :index
     assert_response :success
  end

  test "should have a new action" do
  	get :new
  	assert_response :success
  end

  test "should have a create action" do
  	post :create
  	assert_redirected_to :auctions
  end

end
