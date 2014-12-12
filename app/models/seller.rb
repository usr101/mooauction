class Seller < ActiveRecord::Base

	has_many :bidders, dependent: :destroy
	accepts_nested_attributes_for :bidders,
		reject_if: proc { |attributes| attributes['buyer_id'].blank? }, 
		allow_destroy: true

	validates :name, presence: true, length: {maximum: 75}
	has_many :buyers, through: :bidders
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

	def self.import(file, seller_type_id)

		Seller.transaction do

			CSV.foreach(file.path, headers: true) do |row|
				seller_hash = row.to_hash
				seller_hash['seller_type_id'] = seller_type_id
				seller = Seller.create!(seller_hash)
			end

		end
	end

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
