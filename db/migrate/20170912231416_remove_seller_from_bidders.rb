class RemoveSellerFromBidders < ActiveRecord::Migration
  def change
    remove_column :bidders, :seller_id, :reference
  end
end
