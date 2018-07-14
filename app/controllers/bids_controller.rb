class BidsController < ApplicationController

	def show
		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@seller = Seller.find(params[:seller_id])
	end

	def index 
		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@sellers = @seller_type.sellers
	end

	def new
		@auction = Auction.find(params[:auction_id])
		@seller = Seller.find(params[:seller_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@buyers = @auction.buyers
		@bid = Bid.new
    @bid.seller = @seller
	end

	def create
		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@buyers = @auction.buyers
		@bid = Bid.new(bid_params)
		
    if @bid.save
			redirect_to auction_seller_type_bids_path(@auction, @seller_type)
		else
      @seller = @bid.seller
			render 'new'
		end
	end

	def edit
		@auction = Auction.find(params[:auction_id])
		@seller = Seller.find(params[:seller_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@bid = @seller.bid
		@buyers = @auction.buyers
	end

	def update

		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@buyers = @auction.buyers
		@bid = Bid.find(params[:id])

		if @bid.update(bid_params)
			redirect_to auction_seller_type_bids_path(@auction, @seller_type)
		else 
			render 'edit'
		end

	end

	private

		def bid_params
			params.require(:bid)
				.permit(:id, :buyerbid, :option, :seller_id, :buyer_ids => [])
		end	

end
