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
		@bids = @seller_type.bids
	end

	def new
		@auction = Auction.find(params[:auction_id])
		@seller = Seller.find(params[:seller_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@buyers = @auction.buyers
		@bid = Bid.new

	end

	def create

		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@seller = Seller.find(params[:seller_id])
		@buyers = @auction.buyers
		@bid = Bid.new(bid_params)
		@bid.seller = @seller

		buyer_ids = params[:bid][:buyer_ids]

		buyer_ids.each do | buyer_id |
			if not buyer_id.empty?
				buyer = Buyer.find(buyer_id)
				@bid.buyers << buyer
			end
		end

		if @bid.save
			redirect_to auction_seller_type_sellers_path(@auction, @seller_type)
		else
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
		@seller = Seller.find(params[:seller_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@buyers = @auction.buyers
		@bid = @seller.bid

		if @bid.update(bid_params)
			redirect_to auction_seller_type_sellers_path(@auction, @seller_type)
		else 
			render 'edit'
		end

	end

	private

		def bid_params
			params.require(:bid)
				.permit(:buyerbid, :option, :buyer_ids)
		end	

end
