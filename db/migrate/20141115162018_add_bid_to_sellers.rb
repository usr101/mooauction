class AddBidToSellers < ActiveRecord::Migration
  def change
    add_column :sellers, :bid, :decimal, precision: 30, scale: 2, default: 0
  end
end
