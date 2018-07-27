class Seller < ActiveRecord::Base

	validates :name, presence: true, length: {maximum: 75}
	validates :number, presence: true, length: {maximum: 75}
	validates :weight, numericality: true
	validates :packerbid, numericality: true
	validates :order, numericality: { only_integer: true }
	has_one :bid, dependent: :destroy
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

		if buyerbid.nil?
			return 0
		elsif (buyercalc == "WEIGHT") and (packercalc == "WEIGHT") and (option == 1 )
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

	def self.import(file, seller_type_id)

		Seller.transaction do

			CSV.foreach(file.path, headers: true) do |row|
				seller_hash = row.to_hash
				seller_hash['seller_type_id'] = seller_type_id
				seller = Seller.create!(seller_hash)
			end

		end
	end

	def self.to_csv(sellers)
		CSV.generate do |csv|
			c_names = ["number", "order", "name", "packerbid", 
				         "buyerbid", "option", "weight"]
			csv << c_names
			sellers.each do |seller|
				csv << seller.attributes.values_at(*c_names)
			end
		end
	end

end
