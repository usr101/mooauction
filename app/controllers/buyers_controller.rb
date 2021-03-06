# == Schema Information
#
# Table name: buyers
#
#  id         :integer          not null, primary key
#  number     :integer          not null
#  name       :string(255)      not null
#  auction_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'csv'

class BuyersController < ApplicationController

	# Defines an index action that gets all the buyers for a particular auction
	def index
		@auction = Auction.find(params[:auction_id])
		@buyers = @auction.buyers
		respond_to do |format| 
			format.html
			format.csv {render text: @buyers.to_csv}
		end
	end

	# Bring up the new buyer form.
	def new
		@auction = Auction.find(params[:auction_id])
		@buyer = Buyer.new
		@buyer.auction = @auction
	end

	# Create the new buyer.
	def create
		@auction = Auction.find(params[:auction_id])
		@buyer = Buyer.new(buyer_params)
		@buyer.auction = @auction
		
		if @buyer.save
			redirect_to :auction_buyers
		else
			render 'new'
		end

	end

	def edit
		@buyer = Buyer.find(params[:id])
		@auction = Auction.find(params[:auction_id])
	end

	def update
		@buyer = Buyer.find(params[:id]) 

		if @buyer.update(buyer_params)
			redirect_to :auction_buyers
		else
			render 'edit'
		end
	end

  def show
    @auction = Auction.find(params[:auction_id])
    @buyer = Buyer.find(params[:id])
  end

	def destroy
		@buyer = Buyer.find(params[:id])

		if @buyer.destroy
			redirect_to :auction_buyers
		end
	end

	def import
		@auction = Auction.find(params[:auction_id])
	end

	def upload

		auction = Auction.find(params[:auction_id])
		Buyer.import(params[:file], auction.id)
		redirect_to :auction_buyers

	end

  def invoice

    buyer = Buyer.find(params[:id])
    pdf = InvoicePdf.new(buyer)
    filename = "invoice_#{buyer.number}_#{Time.now.to_i}.pdf"
    send_data pdf.render, filename: filename, type: "application/pdf", disposition: "inline"

  end

	private

		def buyer_params
			params.require(:buyer).permit(:number, :name)
		end

end
