class InvoicesController < ApplicationController
  def index
    @auction = Auction.find(params[:auction_id])
    @buyers = @auction.buyers
  end
end
