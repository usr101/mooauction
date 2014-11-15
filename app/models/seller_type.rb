class SellerType < ActiveRecord::Base
	validates :name, presence: true, length: {maximum: 50}
	belongs_to :auction
	has_many :sellers, dependent: :destroy
end
