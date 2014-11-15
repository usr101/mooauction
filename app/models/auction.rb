class Auction < ActiveRecord::Base
	validates :name, presence: true, length: {maximum: 50}
	has_many :buyers, dependent: :destroy
	has_many :seller_types

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

end
