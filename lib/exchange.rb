require 'stripe'

require "exchange/version"

require 'exchange/invoice_item'
module Exchange

  def self.stripe_api_key=(key)
    Stripe.api_key = key
  end
end
