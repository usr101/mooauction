# == Schema Information
#
# Table name: sellers
#
#  id             :integer          not null, primary key
#  number         :string(255)      not null
#  order          :integer          default(0), not null
#  name           :string(255)      not null
#  packerbid      :decimal(30, 2)   default(0.0)
#  seller_type_id :integer          not null
#  created_at     :datetime
#  updated_at     :datetime
#  buyerbid       :decimal(30, 2)   default(0.0), not null
#  option         :integer
#  weight         :decimal(10, 2)   default(0.0)
#

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
      @seller.packerbid = 0
      @seller.weight = 0
      assert @seller.save
      @saved_seller = Seller.find_by name: "test seller"
      assert_equal "123B", @saved_seller.number
  end


end
