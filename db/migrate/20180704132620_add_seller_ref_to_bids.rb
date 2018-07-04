class AddSellerRefToBids < ActiveRecord::Migration
  def change
    add_reference :bids, :seller, index: true, foreign_key: true
  end
end
