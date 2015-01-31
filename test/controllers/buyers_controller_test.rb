require 'test_helper'

class BuyersControllerTest < ActionController::TestCase

	def setup
    inject_logon_in_session
  end

	test "should have an index action" do
		get :index, auction_id: auctions(:auction1).id
		assert_response :success
	end

  test "should route to invoice" do
    assert_routing "/auctions/1/buyers/1/invoice", 
      { controller: "buyers", action: "invoice", auction_id: "1", id: "1" }
  end

  test "should get pdf invoice" do
    get :invoice, auction_id: auctions(:auction1).id, id: buyers(:buyer1).id 
    assert_response :success
    assert response.headers["Content-Type"] == "application/pdf"
  end


end
