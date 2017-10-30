class RemoveBuyerbidFromSeller < ActiveRecord::Migration
  def change
    remove_column :sellers, :buyerbid, :decimal
  end
end
