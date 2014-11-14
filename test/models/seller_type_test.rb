require 'test_helper'

class SellerTypeTest < ActiveSupport::TestCase

	test "Seller Types should not have names longer than 50 characters" do 

		t = SellerType.new
		t.name = "a" * 51
		assert_not t.save

	end

	test "SellerType should not have blank name" do
		t = SellerType.new
		assert_not t.save
	end


end
