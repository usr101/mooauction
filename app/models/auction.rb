class Auction < ActiveRecord::Base
	validates :name, presence: true, length: {maximum: 50}
	validates :checks_payable, length: {maximum: 150 }
	has_many :buyers, dependent: :destroy
	has_many :seller_types, dependent: :destroy

end
