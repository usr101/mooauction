class AddCalcFieldsToSellerTypes < ActiveRecord::Migration
  def change
  	add_column :seller_types, :packercalc, :string, limit: 6, default: 'NOCALC'
  	add_column :seller_types, :buyercalc, :string, limit: 6, default: 'NOCALC'
  end
end
