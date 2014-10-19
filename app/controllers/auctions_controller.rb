class AuctionsController < ApplicationController

	# Collects all the auctions known to the system.
	def index 
	end

	# Display the new auction form
	def new
	end

	# Create a new auction
	def create
		redirect_to :auctions
	end

end
