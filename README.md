# Exchange

Exchange is a wrapper around the Stripe Charge interface, built to ease
the generation of a Charge from multiple items.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'exchange'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install exchange

## Usage

To use this gem you should first set the api key
Exchange.stripe_api_key = <your private key>

This gem is used by building up an invoice with the Cashier Builder Object

```ruby
cashier = Exchange::Cashier.new
#=> <Exchange::Cashier ...>

# Add a description
subject.description = "Goswim Packages"

# Add a Customer Token
customer = Stripe::Customer.create(email: 'example@example.com')
subject.customer_token = customer.id

# Add a token (usually done through something like stripe.js)
card = Stripe::Token.create(card: { number: "4242424242424242",
                                    exp_month: month,
                                    exp_year: 2018,
                                    cvc: 314 })
subject.card_token = card.id

# Add a few items with an integer amount and description
subject.add_item(999, "Starting Package")
subject.add_item(9999, "Advanced Package")

# Complete the checkout, returns a Stripe Charge Object
response = subject.checkout
#=> <Stripe::Charge ...>
```

## Development

To test with this gem you will need to set an environmental parameter for
your Stripe Private Test Key set to `STRIPE_SECRET_KEY`.
Add something like the following to your environment.

```
# example .env
export STRIPE_SECRET_KEY=<your secret key here>
```

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/exchange/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
