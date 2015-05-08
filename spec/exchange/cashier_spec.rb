require 'spec_helper'

describe Exchange::Cashier do
  subject { described_class.new }

  it 'has an invoice' do
    expect(subject.invoice).to be_an Exchange::Invoice
  end

  it 'adds a description' do
    subject.description = 'GoSwim Packages'
    expect(subject.description).to eq 'GoSwim Packages'
  end

  it 'adds a line item' do
    expect {
      subject.add_item(999, "Starting BackStroke Package")
    }.to change(subject.invoice.line_items, :count).by(1)
  end

  it 'has an amount' do
    subject.add_item(999, "Starting Package")
    subject.add_item(9999, "Advanced Package")
    expect(subject.amount).to eq 10998
  end

  it 'adds a customer_token' do
    subject.customer_token = 'token'
    expect(subject.customer_token).to eq 'token'
  end

  it 'checks out a customer', :vcr do
    subject.description = "Goswim Packages"
    subject.customer_token = stripe_customer_token
    subject.card_token = stripe_card_token

    subject.add_item(999, "Starting Package")
    subject.add_item(9999, "Advanced Package")

    response = subject.checkout
    expect(response.amount).to eq 10998
    expect(response.customer).to eq subject.customer_token
  end

  it 'fails to checkout due to bad customer token' do
  end

end