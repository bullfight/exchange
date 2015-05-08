require 'virtus'
require 'stripe'
require 'active_support/core_ext/module/delegation'

require "exchange/version"

require 'exchange/invoice_item'
require 'exchange/invoice'
require 'exchange/cashier'

module Exchange

  def self.stripe_api_key=(key)
    Stripe.api_key = key
  end
end
