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

	# Retreive the auction and display the edit page
	def edit
		@auction = Auction.find(params[:id])
		render 'edit'
	end

	# Update the auction.
	def update
		@auction = Auction.find(params[:id])

		if @auction.update(auction_params)
			redirect_to :auctions
		else
			render 'edit'
		end
	end

	def delete
		@auction = Auction.find(params[:id])
		render 'delete'
	end

	def destroy
		@auction = Auction.find(params[:id])

		if @auction.destroy
			redirect_to :auctions
		else
			render 'delete'
		end
		
	end

	private

		def auction_params
			params.require(:auction).permit(:name)
		end

end
