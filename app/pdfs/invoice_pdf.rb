class InvoicePdf < Prawn::Document

  def initialize
    super()
    text "This is a test"
  end
end
