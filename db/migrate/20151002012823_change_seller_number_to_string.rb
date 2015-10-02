class ChangeSellerNumberToString < ActiveRecord::Migration
  def change
  	change_column :sellers, :number, :string
  end
end
