class AddSellerTypeReferenceToBids < ActiveRecord::Migration
  def change
  	add_reference :bids, :seller_type
  end
end
