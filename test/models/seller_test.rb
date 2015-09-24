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

  test "seller can have an number with letters" do
      @seller = Seller.new
      @seller.seller_type = seller_types(:chickens)
      @seller.name = "test seller"
      @seller.number = "123B"
      assert @seller.save
      @saved_seller = Seller.find_by name: "test seller"
      assert_equal "123B", @saved_seller.number
  end

end
