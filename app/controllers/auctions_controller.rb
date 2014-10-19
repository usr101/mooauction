class AuctionsController < ApplicationController

	# Collects all the auctions known to the system.
	def index 
		@auctions = Auction.all
	end

	# Display the new auction form
	def new
		@auction = Auction.new
	end

	# Create a new auction
	def create
		@auction = Auction.new(auction_params)
		
		if @auction.save
			redirect_to :auctions
		else
			render 'new'
		end

	end

	private

		def auction_params
			params.require(:auction).permit(:name)
		end

end
