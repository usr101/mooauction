require 'test_helper'

class SellerTypeTest < ActiveSupport::TestCase

	test "Seller Types should not have names longer than 50 characters" do 

		t = seller_types(:chickens)
		t.name = "a" * 51
		assert_not t.save

	end

	test "SellerType should not have blank name" do
		t = seller_types(:chickens)
		t.name = ""
		assert_not t.save
	end 

	test "Buyercalc can only be NOCALC or WEIGHT" do
		t = seller_types(:chickens)
		t.buyercalc = 'TEST'
		assert_not t.save
	end

	test "Packercalc can only be NOCALC or WEIGHT" do
		t = seller_types(:chickens)
		t.packercalc = 'TEST'
		assert_not t.save
	end

	test "Buyercalc can be NOCALC" do
		t = seller_types(:chickens)
		t.buyercalc = 'NOCALC'
		assert t.save
	end

	test "Buyercalc can be WEIGHT" do
		t = seller_types(:chickens)
		t.buyercalc = 'WEIGHT'
		assert t.save
	end

	test "Packercalc can be NOCALC" do
		t = seller_types(:chickens)
		t.packercalc = 'NOCALC'
		assert t.save
	end

	test "Packercalc can be WEIGHT" do
		t = seller_types(:chickens)
		t.packercalc = 'WEIGHT'
		assert t.save
	end

	test "SellerType must be associated with an auction" do
		t = SellerType.new
		t.name = "Test"
		assert_not t.save
	end

end
