class SellersController < ApplicationController

	def index 
		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:type])
		@sellers = Seller.where(seller_type_id: @seller_type.id).where(auction_id: @auction.id).order(:order)
	end

	def new
		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:type])
		@seller = Seller.new
		@next_seller_order_number = Seller.where(auction_id: @auction.id).where(seller_type_id: @seller_type.id).maximum('order') + 1
	end

	def create
		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:type])
		@seller = Seller.new(seller_params)
		@seller.auction = @auction
		@seller.seller_type = @seller_type

		if @seller.save
			redirect_to auction_sellers_path(@auction, type: @seller_type.id)
		else
			render 'new'
		end

	end

	private

		def seller_params
			params.require(:seller).permit(:number, :name, :packerpays, :order)
		end

end
