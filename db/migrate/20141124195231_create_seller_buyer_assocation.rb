class CreateSellerBuyerAssocation < ActiveRecord::Migration
  def change
		create_table :bidders do |t|
    	t.belongs_to :seller
    	t.belongs_to :buyer
    end
  end
end
