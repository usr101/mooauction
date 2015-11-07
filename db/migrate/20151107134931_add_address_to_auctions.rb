class AddAddressToAuctions < ActiveRecord::Migration
  def change
  	add_column :auctions, :address1, :string
  	add_column :auctions, :address2, :string
  	add_column :auctions, :address3, :string
  end
end
