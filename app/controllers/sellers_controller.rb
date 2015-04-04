require 'csv'

class SellersController < ApplicationController

	def index 
		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@sellers = @seller_type.sellers.order(:order)
		respond_to do |format| 
			format.html
			format.csv {render text: Seller.to_csv(@sellers)}
		end
	end

	def new
		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:seller_type_id])
		@seller = Seller.new
		last_seller = Seller.where(seller_type_id: @seller_type.id).maximum('order')
		if not last_seller.nil?
			@next_seller_order_number = last_seller + 1
		else 
			@next_seller_order_number = 1
		end
		2.times { @seller.bidders.build }

	end

	def create
		@seller_type = SellerType.find(params[:seller_type_id])
		@auction = @seller_type.auction
		@seller = Seller.new(seller_params)
		@seller.seller_type = @seller_type

		if @seller.save
			redirect_to auction_seller_type_sellers_path(@auction, @seller_type)
		else
			render 'new'
		end

	end

	def edit
		@seller = Seller.find(params[:id])
		@seller_type = @seller.seller_type
		@auction = @seller_type.auction
		@buyers = @auction.buyers

		if @seller.bidders.count <= 4
			(4 - @seller.bidders.count).times { @seller.bidders.build(:seller_id => @seller.id )}
		end

	end

	def update
		@seller = Seller.find(params[:id])
		@seller_type = @seller.seller_type
		@auction = @seller_type.auction

		if @seller.update(seller_params)
			redirect_to auction_seller_type_sellers_path(@auction, @seller_type)
		else 
			render 'new'
		end
	end

	def destroy
		@seller = Seller.find(params[:id])
		@seller_type = @seller.seller_type
		@auction = @seller_type.auction

		if @seller.destroy
			redirect_to auction_seller_type_sellers_path(@auction, @seller_type)
		end

	end

	def import
		@auction = Auction.find(params[:auction_id])
		@seller_type = SellerType.find(params[:seller_type_id])
	end

	def upload

		auction = Auction.find(params[:auction_id])
		seller_type = SellerType.find(params[:seller_type_id])
		Seller.import(params[:file], seller_type.id)
		redirect_to auction_seller_type_sellers_path(auction, seller_type)

	end

	private

		def seller_params
			params.require(:seller)
				.permit(:number, :name, :packerbid, :order,
							 :buyerbid, :option, :weight, 
							 bidders_attributes: [:id, :buyer_id, :seller_id, :_destroy])
		end

end
