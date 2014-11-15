class SellersController < ApplicationController

	def index 
		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@sellers = Seller.where(seller_type_id: @seller_type.id).where(auction_id: @auction.id).order(:order)
	end

	def new
		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@seller = Seller.new
		last_seller = Seller.where(auction_id: @auction.id).where(seller_type_id: @seller_type.id).maximum('order')
		if not last_seller.nil?
			@next_seller_order_number = last_seller + 1
		else 
			@next_seller_order_number = 1
		end
	end

	def create
		@seller_type = SellerType.find(params[:seller_type_id])
		@auction = @seller_type.auction
		@seller = Seller.new(seller_params)
		@seller.auction = @auction
		@seller.seller_type = @seller_type

		if @seller.save
			redirect_to auction_seller_type_sellers_path(@auction, @seller_type)
		else
			render 'new'
		end

	end

	def edit
		@seller = Seller.find(params[:id])
		@auction = @seller.auction
		@seller_type = @seller.seller_type
	end

	def update
		@seller = Seller.find(params[:id])
		@auction = @seller.auction
		@seller_type = @seller.seller_type

		if seller.update(seller_params)
			redirect_to auction_seller_type_sellers_path(@auction, @seller_type)
		else 
			render 'new'
		end

	end

	def destroy
		@seller = Seller.find(params[:id])
		@auction = @seller.auction
		@seller_type = @seller.seller_type

		if @seller.destroy
			redirect_to auction_seller_type_sellers_path(@auction, @seller_type)
		end

	end

	private

		def seller_params
			params.require(:seller).permit(:number, :name, :packerpays, :order)
		end

end
