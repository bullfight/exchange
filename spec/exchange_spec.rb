require 'spec_helper'

describe Exchange do
  it 'has a version number' do
    expect(Exchange::VERSION).not_to be nil
  end

  it 'sets stripe api key' do
    Exchange.stripe_api_key = ENV.fetch('STRIPE_SECRET_KEY')
    expect(Stripe.api_key).to eq ENV.fetch('STRIPE_SECRET_KEY')
  end
end
