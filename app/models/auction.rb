class Auction < ActiveRecord::Base
	validates :name, presence: true, length: {maximum: 50}

	before_destroy :clean_up_auction_objects

	def total_registered_buyers
		0
	end

	def total_buyer_pays
		0
	end

	def total_packer_pays
		0
	end

	def total_sales
		total_buyer_pays + total_packer_pays
	end

	private 

		def clean_up_auction_objects
			Buyer.delete_all(["auction_id = ?", self.id])
		end

end
