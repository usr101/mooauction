include ActionView::Helpers::NumberHelper 

class InvoicePdf < Prawn::Document


  def initialize(buyer)
    super()
    @buyer = buyer
    @auction = buyer.auction

    font_size 18
    text "INVOICE"
    move_down 5
    font_size 8 
    text "Make Checks Payable To:"
    font 'Times-Roman', :style => :bold
    if @auction.checks_payable.present?
      text @auction.checks_payable
    else 
      text "--No Organization Specified--"
    end
    font 'Times-Roman', :style => :normal
    move_down 10
    text Time.new.strftime("%m/%d/%Y %H:%M:%S")
    move_down 10

    stroke_buyer_data
    move_down 20
    stroke_axis
    stroke_purchase_data

  end

  private 

    def stroke_buyer_data
      buyer_data = [[ {:content => 'Auction Name', :font_style => :bold},
                      {:content => 'Buyer Number', :font_style => :bold},
                      {:content => 'Buyer Name', :font_style => :bold } ]]
      buyer_data += [[{:content => "#{@auction.name}" },
                      {:content => "#{@buyer.number}" },
                      {:content => "#{@buyer.name}"} ]]

      t = make_table(buyer_data, :width => 500)
      t.draw
    end

    def stroke_purchase_data
      purchase_data = [ [{ :content => 'Seller Type', :font_style => :bold}, 
                       { :content => 'Seller Number', :font_style => :bold}, 
                       { :content => 'Seller Name', :font_style => :bold}, 
                       { :content => 'Packer Bid', :font_style => :bold}, 
                       { :content => 'Buyer Bid', :font_style => :bold},
                       { :content => 'Buyer Count', :font_style => :bold}, 
                       { :content => 'Option', :font_style => :bold}, 
                       { :content => 'Buyer Pays', :font_style => :bold} ] ]

      total = 0
      @buyer.sellers.each do |seller| 
        purchase_data += [[seller.seller_type.name.singularize, 
                        seller.number,
                        seller.name, 
                        number_to_currency(seller.packerbid), 
                        number_to_currency(seller.buyerbid),
                        seller.buyers.count,
                        seller.option,
                        number_to_currency(@buyer.pays_for_seller(seller))]]
        total = total + @buyer.pays_for_seller(seller) 
      end
      purchase_data += [[{:content => 'Total', :colspan => 7, :font_style => :bold}, 
                       {:content => number_to_currency(total), :font_style => :bold}]]
    
      t = make_table(purchase_data, :width => 500)
      t.draw
    end

end
