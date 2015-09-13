class AddInvoiceTitleToAuctions < ActiveRecord::Migration
  def change
  	add_column :auctions, :invoice_title, :string, limit: 50
  end
end
