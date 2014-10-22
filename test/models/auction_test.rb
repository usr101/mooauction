require 'test_helper'

class AuctionTest < ActiveSupport::TestCase
 
 test "Auction name cannot be blank" do
 	auction = Auction.new
 	assert_not auction.save, "Saved the auction without a name"
 end

 test "Auction name cannot be longer than 50 characters" do
 	auction = Auction.new
 	name = 'a' * 51
 	assert_not auction.save, "Saved with a name of 51 characters"
 end

end
