# == Schema Information
#
# Table name: auctions
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  checks_payable :string(255)
#  invoice_title  :string(50)
#  address1       :string(255)
#  address2       :string(255)
#  address3       :string(255)
#

class Auction < ActiveRecord::Base
	validates :name, presence: true, length: {maximum: 50}
	validates :checks_payable, length: {maximum: 150 }
	validates :invoice_title, length: {maximum: 50}
	has_many :buyers, dependent: :destroy
	has_many :seller_types, dependent: :destroy

end
