class AllowNullSellerBuyerbid < ActiveRecord::Migration
  def change
  	change_column_null :sellers, :buyerbid, true
  end
end
