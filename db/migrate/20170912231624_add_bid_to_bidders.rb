class AddBidToBidders < ActiveRecord::Migration
  def change
  	add_reference :bidders, :bid
  end
end
