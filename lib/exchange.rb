require 'stripe'

require "exchange/version"

module Exchange

  def self.stripe_api_key=(key)
    Stripe.api_key = key
  end
end
