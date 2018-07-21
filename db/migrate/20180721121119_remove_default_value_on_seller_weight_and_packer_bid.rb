class RemoveDefaultValueOnSellerWeightAndPackerBid < ActiveRecord::Migration
  def change
  	change_column_default :sellers, :weight, nil
  	change_column_default :sellers, :packerbid, nil
  end
end
