require 'test_helper'

class BuyersControllerTest < ActionController::TestCase

	test "should have an index action" do
		get :index, auction_id: auctions(:auction1).id
		assert_response :success
	end

end
