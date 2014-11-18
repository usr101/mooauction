require 'test_helper'

class SellerTest < ActiveSupport::TestCase

	 test "should not be able to create seller without name" do
     @seller = Seller.new
     @seller.seller_type = seller_types(:chickens)
     @seller.number = 3
     assert_not @seller.save
  end

  test "cannot have a name longer than 75 characters" do
  	 @seller = Seller.new
     @seller.seller_type = seller_types(:chickens)
     @seller.name = "a" * 76
     assert_not @seller.save
	end

end
