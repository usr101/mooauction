require 'test_helper'

class AuctionTest < ActiveSupport::TestCase
 
 test "Auction name cannot be blank" do
  auction = Auction.new
  assert_not auction.save, "Saved the auction without a name"
 end

 test "Auction name cannot be longer than 50 characters" do
  auction = Auction.new
  name = 'a' * 51
  auction.name = name
  assert_not auction.save, "Saved with a name of 51 characters"
 end

 test "Auction invoice title cannot be longer than 50 characters" do
 		auction = Auction.new
 		auction.name = "test"
 		title = 'a' * 51
 		auction.invoice_title = title
 		assert_not auction.save, "Saved with an invoice title of 51 characters.  Max should be 50."
 end

end
