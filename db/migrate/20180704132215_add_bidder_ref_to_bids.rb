class AddBidderRefToBids < ActiveRecord::Migration
  def change
    add_reference :bids, :bidder, foreign_key: true
  end
end
