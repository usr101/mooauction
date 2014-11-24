class SellerTypesController < ApplicationController

	def index

		@auction = Auction.find(params[:auction_id])
		@seller_types = @auction.seller_types

	end

	def new
		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.new
		@seller_type.auction = @auction
	end

	def create 
		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.new(seller_type_params)
		@seller_type.auction = @auction

		if @seller_type.save
			redirect_to :auction_seller_types
		else 
			render 'new'
		end

	end

	def edit
		@seller_type = SellerType.find(params[:id])
		@auction = @seller_type.auction
	end

	def update
		@seller_type = SellerType.find(params[:id])
		@auction = @seller_type.auction

		if @seller_type.update(seller_type_params)
			redirect_to :auction_seller_types
		else 
			render 'edit'
		end

	end

	def delete 
		@seller_type = SellerType.find(params[:id])
		@auction = @seller_type.auction
	end

	def destroy
		@seller_type = SellerType.find(params[:id])

		if @seller_type.destroy
			redirect_to :auction_seller_types
		else
			render 'delete'
		end
	end

	private

		def seller_type_params
			params.require(:seller_type).permit(:name,:packercalc,:buyercalc)
		end
	
end
