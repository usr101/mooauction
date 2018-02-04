# Controller for the auction bids


class BidsController < ApplicationController

	def show
		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@seller = Seller.find(params[:seller_id])
	end

	def index 
		@bids = Bid.where("seller_id = ?", params[:seller_id])
	end

	def new
	end

end