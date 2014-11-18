class Seller < ActiveRecord::Base

	validates :name, presence: true, length: {maximum: 75}

	belongs_to :seller_type
	
end
