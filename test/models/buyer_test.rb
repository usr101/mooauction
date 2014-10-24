require 'test_helper'

class BuyerTest < ActiveSupport::TestCase
  
  test "should not be able to create buyer without name" do
     @buyer = Buyer.new
     @buyer.auction(auctions(:auction1))
     @buyer.number = 3
     assert_not @buyer.save
  end

  test "should not be able to create buyer without a number" do
  	 @buyer = Buyer.new
     @buyer.auction(auctions(:auction1))
     @buyer.name = "Test Buyer"
     assert_not @buyer.save
  end

end
