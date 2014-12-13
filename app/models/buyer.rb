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

  def pays_for_seller(seller)

    current_round_mode = BigDecimal.mode(BigDecimal::ROUND_MODE) 
    BigDecimal.mode(BigDecimal::ROUND_MODE, :down) 
    
    num_buyers = seller.buyers.count
    
    buyer_pays_in_cents = seller.buyerpays * 100
    remainder = buyer_pays_in_cents % num_buyers
    payment_in_cents = (buyer_pays_in_cents / num_buyers).round
    if remainder != 0 and seller.oldest_buyer != nil
      payment_in_cents = payment_in_cents + remainder if id == seller.oldest_buyer.id
    end

    BigDecimal.mode(BigDecimal::ROUND_MODE, current_round_mode)
      
    payment_in_dollars = payment_in_cents / 100

  end

	def number_and_name
		"#{number}  #{name}"
	end

end
