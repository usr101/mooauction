class Buyer < ActiveRecord::Base
	belongs_to :auction
	validates :name, presence: true, length: {maximum: 75}
	validates :number, presence: true
end
