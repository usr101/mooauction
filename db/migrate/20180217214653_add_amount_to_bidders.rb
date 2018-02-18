class AddAmountToBidders < ActiveRecord::Migration
  def change
  	add_column :bidders, :amount, :decimal, precision: 30, scale: 2
  end
end
