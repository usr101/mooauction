class Bid < ActiveRecord::Base
	belongs_to :seller
	has_many :bidders
	has_many :buyers, through: :bidders
  validates :buyerbid, numericality: true
  validates :buyernumbers, 
    format: { with: /\A(\d+)(,\d+)*\z/, message: "must be a number, or list of numbers seperated by commas" },
    buyers_exists: true
  validates :option, numericality: { only_integer: true }
  before_save :add_buyers_to_bid


  protected
    def add_buyers_to_bid 

      buyers.clear
      numbers = buyernumbers.split(',')
      numbers.each do |b|
        buyers << Buyer.find_by_number(b)
      end
      
    end


  	
end
