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

class BuyersControllerTest < ActionController::TestCase

	def setup
    inject_logon_in_session
  end

	test "should have an index action" do
		get :index, auction_id: auctions(:auction1).id
		assert_response :success
	end

end
