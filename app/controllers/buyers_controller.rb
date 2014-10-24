class BuyersController < ApplicationController

	# Defines an index action that gets all the buyers for a particular auction
	def index
		@auction = Auction.find(params[:auction_id])
		@buyers = Buyer.where("auction_id = ?", @auction.id).order(:number)
	end

	# Bring up the new buyer form.
	def new
		@auction = Auction.find(params[:auction_id])
		@buyer = Buyer.new
		@buyer.auction = @auction
	end

	# Create the new buyer.
	def create
		@auction = Auction.find(params[:auction_id])
		@buyer = Buyer.new(buyer_params)
		@buyer.auction = @auction
		
		if @buyer.save
			redirect_to :auction_buyers
		else
			render 'new'
		end

	end

	private

		def buyer_params
			params.require(:buyer).permit(:number, :name)
		end

end
