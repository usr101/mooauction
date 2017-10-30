class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.decimal :buyerbid, precision: 30, scale: 2
      t.integer :option
      t.references :seller

      t.timestamps
    end
  end
end
