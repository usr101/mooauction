# == Schema Information
#
# Table name: sellers
#
#  id             :integer          not null, primary key
#  number         :string(255)      not null
#  order          :integer          default(0), not null
#  name           :string(255)      not null
#  packerbid      :decimal(30, 2)   default(0.0)
#  seller_type_id :integer          not null
#  created_at     :datetime
#  updated_at     :datetime
#  buyerbid       :decimal(30, 2)   default(0.0), not null
#  option         :integer
#  weight         :decimal(10, 2)   default(0.0)
#

module SellersHelper

	def buyer_list(buyers) 

		buyers_array = Array.new
		if buyers.count > 0 
			buyers.each do |buyer| 
				if buyer.name.nil?
					buyers_array = "unknown"
				else 
					buyers_array << buyer.name
				end
			end 
			buyers_array.join(", ")
		else 
			"None"
		end
	end

end
