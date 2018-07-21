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
    	@next_seller_path = lookup_next_path
    	@prev_seller_path = lookup_prev_path	
	end

	def create
		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@buyers = @auction.buyers
		@bid = Bid.new(bid_params)
		
	    if @bid.save
	    	if params[:commit] == 'next'
	    		redirect lookup_next_path
			elsif params[:commit] == 'prev'
				redirect lookup_prev_path
			else
				redirect_to auction_seller_type_bids_path(@auction, @seller_type)
			end
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
    	@next_seller_path = lookup_next_path
    	@prev_seller_path = lookup_prev_path		
	end

	def update

		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@buyers = @auction.buyers
		@bid = Bid.find(params[:id])

		if @bid.update(bid_params)
			if params[:commit] == 'next'
				redirect_to lookup_next_path
			elsif params[:commit] == 'prev'
				redirect_to lookup_prev_path
			else
				redirect_to auction_seller_type_bids_path(@auction, @seller_type)
			end
		else 
			render 'edit'
		end

	end

  	def destroy
		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@bid = Bid.find(params[:id])
		if @bid.destroy
			redirect_to auction_seller_type_bids_path(@auction, @seller_type)
		end
  	end

	private

		def bid_params
			params.require(:bid)
				.permit(:id, :buyerbid, :option, :seller_id, :buyer_ids => [])
		end

		def lookup_next_seller
	    	@seller_type.sellers.where("sellers.order > ?", @bid.seller.order).order(:order).first
		end

		def lookup_prev_seller
			@seller_type.sellers.where("sellers.order < ?", @bid.seller.order).order(:order).last
		end

		def lookup_prev_path
			prev_seller = lookup_prev_seller
			if prev_seller
				prev_seller_bid = prev_seller.bid
				if prev_seller_bid
					edit_auction_seller_type_bid_path(@auction, @seller_type, prev_seller_bid, :seller_id => prev_seller.id)
				else 
					new_auction_seller_type_bid_path(@auction, @seller_type, prev_seller_bid, :seller_id => prev_seller.id)
				end
			else
				last_seller = @seller_type.sellers.order(:order).last
				last_seller_bid = last_seller.bid
				if last_seller_bid
					edit_auction_seller_type_bid_path(@auction, @seller_type, last_seller_bid, :seller_id => last_seller.id)
				else 
					new_auction_seller_type_bid_path(@auction, @seller_type, last_seller_bid, :seller_id => last_seller.id)
				end
			end				
		end

		def lookup_next_path
			next_seller = lookup_next_seller
			if next_seller
				next_seller_bid = next_seller.bid
				if next_seller_bid
					edit_auction_seller_type_bid_path(@auction, @seller_type, next_seller_bid, :seller_id => next_seller.id)
				else 
					new_auction_seller_type_bid_path(@auction, @seller_type, next_seller_bid, :seller_id => next_seller.id)
				end
			else
				first_seller = @seller_type.sellers.order(:order).first
				first_seller_bid = first_seller.bid
				if first_seller_bid
					edit_auction_seller_type_bid_path(@auction, @seller_type, first_seller_bid, :seller_id => first_seller.id)
				else 
					new_auction_seller_type_bid_path(@auction, @seller_type, first_seller_bid, :seller_id => first_seller.id)
				end
			end				
		end

end
