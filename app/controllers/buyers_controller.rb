class BuyersController < ApplicationController

	# Defines an index action that gets all the buyers for a particular auction
	def index
		@auction = Auction.find(params[:auction_id])
		@buyers = Buyer.where("auction_id = ?", @auction.id)
	end

end
