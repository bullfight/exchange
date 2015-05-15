module Exchange
  class InvalidCustomer < StandardError; end
  class InvalidCard < StandardError; end
  class Cashier
    include Virtus.model
    attribute :customer_token
    attribute :card_token
    attribute :receipt, Boolean, default: false

    def invoice
      @invoice ||= Invoice.new
    end
    delegate :description, :description=, :amount, to: :invoice

    def add_item(amount, description)
      line_item = InvoiceItem.new(amount: amount,
                                  description: description)
      invoice.add_line_item(line_item)
    end

    def send_receipt
      @receipt = true
    end

    def checkout
      customer = Stripe::Customer.retrieve(customer_token)
      source = customer.sources.create(source: card_token)
      options = { amount: amount,
                  currency: 'usd',
                  customer: customer.id,
                  source: source.id,
                  description: description,
                  statement_descriptor: description[0, 22],
                  capture: true }

      options[:receipt_email] = customer.email if receipt

      Stripe::Charge.create(options)
    rescue Stripe::InvalidRequestError => error
      if error.message =~ /No such customer/
        raise InvalidCustomer.new "Customer Not Found"
      else
        raise error
      end
    rescue Stripe::CardError => error
      raise InvalidCard.new error.message
    end
  end
end
