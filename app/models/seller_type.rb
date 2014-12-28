class SellerType < ActiveRecord::Base
	validates :name, presence: true, length: {maximum: 50}
	validates :buyercalc, inclusion: { in: %w(NOCALC WEIGHT) }
	validates :packercalc, inclusion: { in: %w(NOCALC WEIGHT ) }
	belongs_to :auction
	validates :auction, presence: true
	has_many :sellers, dependent: :destroy
end
