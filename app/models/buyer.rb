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

  # Calculate the amount the buyers owe the seller.
  def pays_for_seller(seller)

    current_round_mode = BigDecimal.mode(BigDecimal::ROUND_MODE) 
    BigDecimal.mode(BigDecimal::ROUND_MODE, :down) 

    payment_in_cents = 0
    
    # if there are any bids, the calculate the amount paid by the buyers.
    if seller.bid 

	    num_buyers = seller.bid.buyers.count
    
	    if seller.bid.buyerpays != 0 
	    	buyer_pays_in_cents = seller.bid.buyerpays * 100
	    	remainder = buyer_pays_in_cents % num_buyers
	    	payment_in_cents = (buyer_pays_in_cents / num_buyers).round
	    	if remainder != 0 and seller.oldest_buyer != nil
	      	payment_in_cents = payment_in_cents + remainder if id == seller.bid.oldest_buyer.id
	    	end
		end

	end

    BigDecimal.mode(BigDecimal::ROUND_MODE, current_round_mode)
      
	payment_in_cents / 100.00 

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
