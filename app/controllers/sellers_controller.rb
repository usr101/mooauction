class SellersController < ApplicationController

	def index 
		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:type])
		@sellers = Seller.where(seller_type_id: @seller_type.id).where(auction_id: @auction.id).order(:order)
	end

end
