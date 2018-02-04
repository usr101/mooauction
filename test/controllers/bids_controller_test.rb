require 'test_helper'

class BidsControllerTest < ActionController::TestCase

	def setup
    	inject_logon_in_session
  	end

	test "should get an index" do 
		get :index, auction_id: auctions(:auction1).id, seller_type_id: seller_types(:chickens), seller_id: sellers(:seller1)
		assert_response :success
		assert_not_nil assigns(:bids)
	end

	test "should get a new" do 
		get :new, auction_id: auctions(:auction1).id, seller_type_id: seller_types(:chickens), seller_id: sellers(:seller1)
		assert_response :success
	end
	

end