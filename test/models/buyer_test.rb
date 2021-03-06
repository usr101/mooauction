# == Schema Information
#
# Table name: buyers
#
#  id         :integer          not null, primary key
#  number     :integer          not null
#  name       :string(255)      not null
#  auction_id :integer
#  created_at :datetime
#  updated_at :datetime
#

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

  test "buyers require an auction" do
    @buyer = Buyer.new
    @buyer.name = "Test Buyer"
    assert_not @buyer.save
  end

  test "buyers require a number that is unique to the auction" do
    buyer = Buyer.new
    buyer.number = 100
    buyer.name = "Test Buyer"
    buyer.auction(auctions(:auction1))
    buyer.save
    buyer2 = Buyer.new
    buyer2.number = 100
    buyer2.name = "Test Buyer 2"
    buyer2.auction(auctions(:auction1))
    assert_not buyer2.save
  end

end
