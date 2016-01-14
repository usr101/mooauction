# == Schema Information
#
# Table name: auctions
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  checks_payable :string(255)
#  invoice_title  :string(50)
#  address1       :string(255)
#  address2       :string(255)
#  address3       :string(255)
#

class AuctionsController < ApplicationController

	before_action :logged_in_user

	# Collects all the auctions known to the system.
	def index 
		@auctions = Auction.all.order(:created_at)
	end

	# Display the new auction form
	def new
		@auction = Auction.new
	end

	# Create a new auction
	def create
		@auction = Auction.new(auction_params)
		
		if @auction.save
			redirect_to :auctions
		else
			render 'new'
		end

	end

	# Retreive the auction and display the edit page
	def edit
		@auction = Auction.find(params[:id])
		render 'edit'
	end

	# Update the auction.
	def update
		@auction = Auction.find(params[:id])

		if @auction.update(auction_params)
			redirect_to :auctions
		else
			render 'edit'
		end
	end

	def delete
		@auction = Auction.find(params[:id])
		render 'delete'
	end

	def destroy
		@auction = Auction.find(params[:id])

		if @auction.destroy
			redirect_to :auctions
		else
				render 'delete'
		end

	end

	def show
		@auction = Auction.find(params[:id])
		@seller_types = @auction.seller_types
	end

	private

		def auction_params
			params.require(:auction).permit(:name, :checks_payable, 
				:invoice_title, :address1, :address2, :address3)
		end

		def logged_in_user
			unless logged_in?
				flash[:danger] = "Please log in"
				redirect_to login_path
			end
		end

end
