class AddChecksPayableToAuction < ActiveRecord::Migration
  def change
  	add_column :auctions, :checks_payable, :string
  end
end
