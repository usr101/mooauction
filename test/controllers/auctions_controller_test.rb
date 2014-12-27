require 'test_helper'

class AuctionsControllerTest < ActionController::TestCase

  def setup
    inject_logon_in_session
  end
 
  test "should have index" do
     get :index
     assert_response :success
  end

  test "should have a new action" do
  	get :new
  	assert_response :success
  end

  test "should have a create action" do
  	post :create, auction: { name: 'Some Auction'}
  	assert_redirected_to :auctions
  end

  test "should have a show action" do
    get :show, id: auctions(:auction1).id
    assert_response :success
  end

  test "should have an edit action" do
    get :edit, id: auctions(:auction1).id
    assert_response :success
  end

  test "should have an update action" do
    patch :update, id: auctions(:auction1).id, auction: {name: 'Some Auction'}
    assert_redirected_to :auctions
  end

  test "should have a delete page" do
    get :delete, id: auctions(:auction1).id
    assert_response :success
  end

  test "should have a destroy action" do
    delete :destroy, id: auctions(:auction1).id
    assert_redirected_to :auctions
  end

end
