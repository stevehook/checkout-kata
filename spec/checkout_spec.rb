require_relative '../lib/checkout'
require 'bigdecimal'

RSpec.describe Checkout do
  let(:rules) { {} }
  subject { Checkout.new(rules) }

  it 'initial total is zero' do
    expect(subject.total).to eql BigDecimal('0.0')
  end

  context 'without rules' do
    it 'can scan items' do
      subject.scan('001')
      expect(subject.total).to eql BigDecimal('9.25')
    end

    it 'can scan multiple items' do
      subject.scan('001')
      subject.scan('002')
      subject.scan('003')
      expect(subject.total).to eql BigDecimal('74.20')
    end
  end

  context 'with rules' do
    let(:rules) { [
      Checkout::MultiBuyPromotion.new('001', BigDecimal('8.50'), 2),
      Checkout::TotalSpendPromotion.new(BigDecimal('60.0'), 10)
    ] }

    it 'can scan items' do
      subject.scan('001')
      expect(subject.total).to eql BigDecimal('9.25')
    end

    it 'can scan multiple items and applies discount for total spend' do
      subject.scan('001')
      subject.scan('002')
      subject.scan('003')
      expect(subject.total).to eql BigDecimal('66.78')
    end

    it 'can scan multiple items and applies multibuy discount' do
      subject.scan('001')
      subject.scan('003')
      subject.scan('001')
      expect(subject.total).to eql BigDecimal('36.95')
    end

    it 'can scan multiple items and applies both multibuy and total spend discounts' do
      subject.scan('001')
      subject.scan('002')
      subject.scan('001')
      subject.scan('003')
      expect(subject.total).to eql BigDecimal('73.76')
    end
  end
end
