class AddAuctionIdColumnToSellerTypes < ActiveRecord::Migration
  
  def change
	  change_table :seller_types do |t|
	  	t.references :auction, index:true
	  end
	end

end
