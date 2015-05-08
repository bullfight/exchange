require 'spec_helper'

describe Exchange::InvoiceItem do
  subject { described_class.new(amount: 999,
                                description: "Package 1") }

  it 'has an amount' do
    expect(subject.amount).to eq 999
  end

  it 'has a description' do
    expect(subject.description).to eq "Package 1"
  end
end
