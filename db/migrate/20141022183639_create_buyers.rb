class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.integer :number
      t.string :name
      t.references :auction, index: true

      t.timestamps
    end
  end
end
