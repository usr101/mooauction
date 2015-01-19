include ActionView::Helpers::NumberHelper 

class InvoicePdf < Prawn::Document


  def initialize(buyer)
    super()
    @buyer = buyer
    @auction = buyer.auction

    font_size 8 
    text "Invoice"
    text "Auction Name: #{@auction.name}"
    text "Buyer Number: #{buyer.number}"
    text "Buyer Name: #{buyer.name}"

    purchase_data = [ ['Seller Number', 
                       'Seller Name', 
                       'Seller Type', 
                       'Packer Bid', 
                       'Buyer Bid',
                       'Buyer Count', 
                       'Option', 
                       'Buyer Pays'] ]

    total = 0
    buyer.sellers.each do |seller| 
      purchase_data += [[seller.number, 
                        seller.name, 
                        seller.seller_type.name.singularize, 
                        number_to_currency(seller.packerbid), 
                        number_to_currency(seller.buyerbid),
                        seller.buyers.count,
                        seller.option,
                        number_to_currency(buyer.pays_for_seller(seller))]]
      total = total + buyer.pays_for_seller(seller) 
    end
    purchase_data += [[{:content => 'Total', :colspan => 7, :font_style => :bold}, 
                       {:content => number_to_currency(total), :font_style => :bold}]]
    
    t = make_table(purchase_data)
    t.draw
  end

end
