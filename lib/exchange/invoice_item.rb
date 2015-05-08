module Exchange
  class InvoiceItem
    include Virtus.model
    attribute :amount, Integer, default: 0
    attribute :description, String, default: ""
  end
end
