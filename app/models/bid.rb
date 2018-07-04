class Bid < ActiveRecord::Base

	belongs_to :seller
  has_many :bidders
	has_many :buyers, through: :bidders
  validates :seller, presence: true

end
