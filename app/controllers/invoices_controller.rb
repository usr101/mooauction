class InvoicesController < ApplicationController

  def index
    @auction = Auction.find(params[:auction_id])
    @buyers = @auction.buyers
  end

  def show
    @buyer = Buyer.find(params[:id])
    pdf = InvoicePdf.new(@buyer)
    filename = "invoice_#{@buyer.number}_#{Time.now.to_i}.pdf"
    send_data pdf.render, filename: filename, type: "application/pdf", disposition: "inline"
  end

end
