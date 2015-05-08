module Exchange
  class Cashier
    attr_accessor :customer_token, :card_token

    def invoice
      @invoice ||= Invoice.new
    end
    delegate :description, :description=, :amount, to: :invoice

    def add_item(amount, description)
      line_item = InvoiceItem.new(amount: amount,
                                  description: description)
      invoice.add_line_item(line_item)
    end

    def checkout
      customer = Stripe::Customer.retrieve(customer_token)
      source = customer.sources.create(source: card_token)
      Stripe::Charge.create(amount: amount,
                            currency: 'usd',
                            customer: customer.id,
                            source: source.id,
                            description: description,
                            statement_descriptor: description[0, 22],
                            capture: true)
    end
  end
end
