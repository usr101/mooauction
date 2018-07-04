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

end
