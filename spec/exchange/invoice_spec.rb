require 'spec_helper'

describe Exchange::Invoice do
  let(:line_item) { double(:line_item,
                           amount: 999, description: "Package 1") }
  subject { described_class.new(description: "GoSwim Packages") }

  it 'has an amount' do
    expect(subject.amount).to eq 0
  end

  it 'has a description' do
    expect(subject.description).to eq "GoSwim Packages"
  end

  it 'has line items' do
    expect(subject.line_items).to eq []
  end

  it 'adds a line item' do
    expect {
      subject.add_line_item(line_item)
    }.to change(subject.line_items, :count).by(1)
  end

  context 'with a line item' do

    before do
      subject.add_line_item(line_item)
    end

    it 'has a summed amount' do
      expect(subject.amount).to eq 999
    end

    it 'has a joined description' do
      expect(subject.description).to eq "GoSwim Packages: Package 1"
    end
  end
end
