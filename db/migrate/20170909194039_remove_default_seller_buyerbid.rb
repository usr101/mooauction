class RemoveDefaultSellerBuyerbid < ActiveRecord::Migration
  def change
  	change_column_default :sellers, :buyerbid, nil
  end
end
