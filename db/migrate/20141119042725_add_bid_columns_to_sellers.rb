class AddBidColumnsToSellers < ActiveRecord::Migration
  def change
  	add_column :sellers, :buyerbid, :decimal, precision: 30, scale: 2, null: false, default: 0
  	add_column :sellers, :option, :integer, null: true
  	add_reference :sellers, :bid, null: true, index: true
  	rename_column :sellers, :packerpays, :packerbid
  	add_column :sellers, :weight, :decimal, precision: 10, scale: 2, null: true, default: 0
  end
end
