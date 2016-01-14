# == Schema Information
#
# Table name: bidders
#
#  id        :integer          not null, primary key
#  seller_id :integer
#  buyer_id  :integer
#

class Bidder < ActiveRecord::Base
	belongs_to :seller
	belongs_to :buyer
end
