require 'test_helper'

class BidTest < ActiveSupport::TestCase

  test "valid bid" do
    bid = Bid.new(buyerbid: 100, option: 1, seller: sellers(:seller1), buyers: [buyers(:buyer1)])
    assert bid.valid?
  end

  test "requires seller" do
    bid = Bid.new(buyerbid: 100, option: 1, buyers: [buyers(:buyer1)])
    refute bid.valid?
  end

end
