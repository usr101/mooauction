class Bid < ActiveRecord::Base
	belongs_to :seller
  has_many :bidders
	has_many :buyers, through: :bidders
  validates :seller, presence: true
  validates :buyers, presence: true
  validates :buyerbid, numericality: true
  validates :option, numericality: { only_integer: true }

  def oldest_buyer
    if buyers.count == 0 
      return nil
    elsif buyers.count > 1
      buyers.max_by {|b| b.created_at}
    else
      buyers.first
    end
  end

end
