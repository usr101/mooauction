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
