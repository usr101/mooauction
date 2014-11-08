class SellersController < ApplicationController

	def index 
		@seller_type = SellerType.find(params[:type])
	end

end
