class Bid < ActiveRecord::Base
	belongs_to :seller
	has_many :bidders
	has_many :buyers, through: :bidders
  validates :buyerbid, numericality: true
  validates :option, numericality: { only_integer: true }
  	
end
