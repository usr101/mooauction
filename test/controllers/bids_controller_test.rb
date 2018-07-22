require 'test_helper'

class BidsControllerTest < ActionController::TestCase

	def setup
    	inject_logon_in_session
 	end

  test "should get index" do
    auction = auctions(:auction1)
    seller_type = seller_types(:chickens)
    get :index, :auction_id => auction.id, :seller_type_id => seller_type.id
    assert_response :success
    assert_not_nil assigns(:auction)
    assert_not_nil assigns(:seller_type)
    assert_not_nil assigns(:sellers)
  end

  test "should get new" do
    auction = auctions(:auction1)
    seller_type = seller_types(:chickens)
    seller = sellers(:seller1)
    get :new, :auction_id => auction.id, :seller_type_id => seller_type.id, :seller_id => seller.id
    assert_response :success
    assert_not_nil assigns(:auction)
    assert_not_nil assigns(:seller_type)
    assert_not_nil assigns(:bid)
    assert_not_nil assigns(:seller)
    assert_not_nil assigns(:buyers)
  end

  test "should be able to create" do
    auction = auctions(:auction1)
    seller_type = seller_types(:chickens)
    seller = sellers(:seller1)
    buyer = buyers(:buyer1)
    post :create, :auction_id => auction.id, 
                  :seller_type_id => seller_type.id, 
                  bid: {buyerbid: 100, option: 1, buyer_id: buyer.id, seller_id: seller.id}
    assert_not_nil assigns(:auction)
    assert_not_nil assigns(:seller_type)
  end

end
