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

class SellersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
