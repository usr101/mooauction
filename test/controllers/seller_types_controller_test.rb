# == Schema Information
#
# Table name: seller_types
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  auction_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  packercalc :string(6)        default("NOCALC")
#  buyercalc  :string(6)        default("NOCALC")
#

require 'test_helper'

class SellerTypesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
