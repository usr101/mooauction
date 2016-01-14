# == Schema Information
#
# Table name: auctions
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  checks_payable :string(255)
#  invoice_title  :string(50)
#  address1       :string(255)
#  address2       :string(255)
#  address3       :string(255)
#

require 'test_helper'

class AuctionsControllerTest < ActionController::TestCase

  def setup
    inject_logon_in_session
  end
 
  test "should have index" do
     get :index
     assert_response :success
  end

  test "should have a new action with appropriate fields" do
  	get :new
  	assert_response :success
    assert_template :new
    assert_template layout: "layouts/application", partial: "_form"
    assert_select 'input#auction_name'
    assert_select 'input#auction_checks_payable'
    assert_select 'input#auction_invoice_title'
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

  test "should error when invoice_title is invalid on new" do
    invalid_invoice_title = "a" * 51
    post :create, auction: {name: 'Some Auction', invoice_title: invalid_invoice_title }
    assert_template :new
  end

  test "should have address1 field" do
    get :edit, id: (auctions(:auction1).id)
    assert_response :success
    assert_select "#auction_address1"
  end

  test "should have address2 field" do
    get :edit, id: (auctions(:auction1).id)
    assert_response :success
    assert_select "#auction_address2"
  end 

  test "should have address3 field" do
    get :edit, id: (auctions(:auction1).id)
    assert_response :success
    assert_select "#auction_address3"
  end    

end
