class Buyer < ActiveRecord::Base

	require 'csv'

	belongs_to :auction
	validates :name, presence: true, length: {maximum: 75}
	validates :number, presence: true
	validates :auction, presence: true
	validates :number, uniqueness: {scope: :auction}
	has_many :bidders
	has_many :sellers, through: :bidders

	def self.import(file, auction_id)

		Buyer.transaction do

			CSV.foreach(file.path, headers: true) do |row|
				buyer_hash = row.to_hash
				buyer_hash['auction_id'] = auction_id
				buyer = Buyer.create!(buyer_hash)
			end

		end
	end

end
