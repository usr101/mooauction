class Bidder < ActiveRecord::Base
	belongs_to :bid
	belongs_to :buyer
end
