require 'test_helper'

class BuyersControllerTest < ActionController::TestCase

	def setup
    inject_logon_in_session
  end

	test "should have an index action" do
		get :index, auction_id: auctions(:auction1).id
		assert_response :success
	end

  test "should route to receipt" do
    assert_routing "/auctions/1/buyers/1/receipt", 
      { controller: "buyers", action: "receipt", auction_id: "1", id: "1" }
  end

  test "should get receipt" do
    get :receipt, auction_id: auctions(:auction1).id, id: 1
    assert_response :success
  end

end
