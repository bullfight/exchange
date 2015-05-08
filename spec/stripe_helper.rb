module StripeHelper
  def stripe_card_token(month = 10)
    Stripe::Token.create(card: { number: "4242424242424242",
                                 exp_month: month,
                                 exp_year: 2018,
                                 cvc: 314 }).id
  end

  def stripe_card_token_failed
    Stripe::Token.create(card: { number: "4000000000000002",
                                 exp_month: 12,
                                 exp_year: 2018,
                                 cvc: 314 }).id
  end

  def stripe_customer_token
    stripe_customer.id
  end

  def stripe_customer
    Stripe::Customer.create(email: 'example@example.com')
  end

  def retrieve_customer(token)
    Stripe::Customer.retrieve(token)
  end

  def retrieve_event(token)
    Stripe::Event.retrieve(token)
  end
end
