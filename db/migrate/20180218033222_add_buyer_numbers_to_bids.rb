class AddBuyerNumbersToBids < ActiveRecord::Migration
  def change
  	add_column :bids, :buyernumbers, :string
  end
end
