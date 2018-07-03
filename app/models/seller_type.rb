# == Schema Information
#
# Table name: seller_types
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  auction_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  packercalc :string(6)        default("NOCALC")
#  buyercalc  :string(6)        default("NOCALC")
#

class SellerType < ActiveRecord::Base
	validates :name, presence: true, length: {maximum: 50}
	validates :buyercalc, inclusion: { in: %w(NOCALC WEIGHT) }
	validates :packercalc, inclusion: { in: %w(NOCALC WEIGHT ) }
	belongs_to :auction
	validates :auction, presence: true
	has_many :sellers, dependent: :destroy
	has_many :bids, dependent: :destroy
end
