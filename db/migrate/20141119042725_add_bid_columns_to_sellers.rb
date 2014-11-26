class AddBidColumnsToSellers < ActiveRecord::Migration
  def change
  	add_column :sellers, :buyerbid, :decimal, precision: 30, scale: 2, null: false, default: 0
  	add_column :sellers, :option, :integer, null: true
  	rename_column :sellers, :packerpays, :packerbid
  	add_column :sellers, :weight, :decimal, precision: 10, scale: 2, null: true, default: 0
  end
end
