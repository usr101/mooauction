class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.integer :number, null: false
      t.integer :order, null: false, default: 0
      t.string :name, null: false
      t.decimal :packerpays, precision: 30, scale: 2, default: 0
      t.references :auction, null: false, index: true
      t.references :seller_type, null: false, index: true

      t.timestamps
    end
  end
end
