class RemoveOptionFromSellers < ActiveRecord::Migration
  def change
  	remove_column :sellers, :option, :integer
  end
end
