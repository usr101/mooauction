class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.integer :number, null: false
      t.string :name, null: false
      t.references :auction, index: true

      t.timestamps
    end
  end
end
