class RemoveSellerTypeRefFromBids < ActiveRecord::Migration
  def change
    remove_reference :bids, :seller_type
  end
end
