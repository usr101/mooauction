class RemoveSellerReferenceFromBids < ActiveRecord::Migration
  def change
  	remove_column :bids, :seller_id, :reference 
  end
end
