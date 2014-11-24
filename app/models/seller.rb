class Seller < ActiveRecord::Base

	validates :name, presence: true, length: {maximum: 75}

	belongs_to :seller_type
	
	def packerpays
		packercalc = seller_type.packercalc

		if option == 1
			if packercalc == "WEIGHT" 
				return packerbid * weight
			else 
				return packerbid
			end
		else 
			return 0
		end
	end

	def buyerpays

		buyercalc = seller_type.buyercalc
		packercalc = seller_type.packercalc

		if (buyercalc == "WEIGHT") and (packercalc == "WEIGHT") and (option == 1 )
			return (buyerbid - packerbid) * weight
		elsif (buyercalc == "WEIGHT") and (packercalc == "WEIGHT") and (option != 1)
			return buyerbid * weight
		elsif (buyercalc == "WEIGHT") and (packercalc == "NOCALC") and (option == 1)
			return (buyerbid * weight) - packerbid
		elsif (buyercalc == "WEIGHT") and (packercalc == "NOCALC") and (option != 1)
			return buyerbid * weight
		elsif (buyercalc == "NOCALC") and (packercalc == "WEIGHT") and (option == 1)
			return buyerbid - (packerbid * weight)
		elsif (buyercalc == "NOCALC") and (packercalc == "WEIGHT") and (option != 1)
			return buyerbid
		elsif (buyercalc == "NOCALC") and (packercalc == "NOCALC") and (option == 1)
			return buyerbid - packerbid
		elsif (buyercalc == "NOCALC") and (packercalc == "NOCALC") and (option != 1)
			return buyerbid
		else
			return buyerbid
		end
	end

end
