class Seller < ActiveRecord::Base
	belongs_to :auction
	belongs_to :seller_type
end
