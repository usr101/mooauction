class BuyersExistsValidator < ActiveModel::EachValidator

	def validate_each(record, attribute, value)
		lookup_values = value.split(',')
		lookup_values.each do |n|
			b = Buyer.find_by number: n
			if (b.nil?)
				record.errors[attribute] << "is not valid, because the buyer #{n} does not exist"
			end
		end
	end

end