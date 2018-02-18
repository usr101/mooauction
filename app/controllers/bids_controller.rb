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
		@auction = Auction.find(params[:auction_id])
		@seller = Seller.find(params[:seller_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@bid = Bid.new
	end

	def create

		@auction = Auction.find(params[:auction_id])
		@seller = Seller.find(params[:seller_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@bid = Bid.new(bid_params)
		@bid.seller = @seller

		if @bid.save
			redirect_to auction_seller_type_sellers_path(@auction, @seller_type)
		else
			render 'new'
		end

	end

	private

		def bid_params
			params.require(:bid)
				.permit(:buyerbid, :buyernumbers, :option)
		end	

end