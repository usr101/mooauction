class Buyer < ActiveRecord::Base

	require 'csv'

	belongs_to :auction
	validates :name, presence: true, length: {maximum: 75}
	validates :number, presence: true, numericality: { only_integer: true }
	validates :auction, presence: true
	validates :number, uniqueness: {scope: :auction}
	has_many :bidders
	has_many :bids, through: :bidders

	def self.import(file, auction_id)

		Buyer.transaction do

			CSV.foreach(file.path, headers: true) do |row|
				buyer_hash = row.to_hash
				buyer_hash['auction_id'] = auction_id
				buyer = Buyer.create!(buyer_hash)
			end

		end
	end
  
  def number_and_name
	"#{number}  #{name}"
  end

  def self.to_csv
	CSV.generate do |csv|
		c_names = ["number", "name"]
		csv << c_names
		all.each do |buyer|
			csv << buyer.attributes.values_at(*c_names)
		end
	end
  end

end
