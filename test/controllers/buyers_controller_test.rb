# == Schema Information
#
# Table name: buyers
#
#  id         :integer          not null, primary key
#  number     :integer          not null
#  name       :string(255)      not null
#  auction_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class BuyersControllerTest < ActionController::TestCase

	def setup
    inject_logon_in_session
  end

	test "should have an index action" do
		get :index, auction_id: auctions(:auction1).id
		assert_response :success
	end

  test "should route to invoice" do
    assert_routing "/auctions/1/buyers/1/invoice", 
      { controller: "buyers", action: "invoice", auction_id: "1", id: "1" }
  end

  test "should get pdf invoice with invoice_title" do
    get :invoice, auction_id: auctions(:auction1).id, id: buyers(:buyer1).id 
    assert_response :success
    assert response.headers["Content-Type"] == "application/pdf"
    pdf_content = PDF::Reader.new(StringIO.new(response.body)).page(1).to_s
    assert pdf_content.include?(auctions(:auction1).invoice_title), "PDF Invoice does not contain invoice title."
  end

  test "should get pdf invoice with INVOICE for invoice title if none provided" do
    get :invoice, auction_id: auctions(:auction2).id, id: buyers(:buyer5).id 
    assert_response :success
    assert response.headers["Content-Type"] == "application/pdf"
    pdf_content = PDF::Reader.new(StringIO.new(response.body)).page(1).to_s
    assert pdf_content.include?("INVOICE"), "PDF Invoice does not contain default invoice title."
  end

  test "should have invoice head link for buyers" do
    get :index, auction_id: auctions(:auction1).id
    assert_select ".table > thead > tr > th:nth-child(5)", "Invoice"
    assert_select ".table > tbody > tr > td:nth-child(5) > a[href$=invoice]"
  end


end
