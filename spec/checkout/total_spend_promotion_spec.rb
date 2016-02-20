require_relative '../../lib/checkout'

RSpec.describe Checkout::TotalSpendPromotion do
  subject { described_class.new(BigDecimal('50.0'), 25) }

  it 'does not apply when the total equals the minimum' do
    expect(subject.apply_to_total(BigDecimal('50.0'))).to eql BigDecimal('50.00')
  end

  it 'applies to when the total exceeds the minimum' do
    expect(subject.apply_to_total(BigDecimal('60.0'))).to eql BigDecimal('45.00')
  end

  it 'does not apply when the total is less than the minimum' do
    expect(subject.apply_to_total(BigDecimal('40.0'))).to eql BigDecimal('40.00')
  end

  it 'does not apply item prices' do
    expect(subject.apply_to_price(BigDecimal('45.67'), 99)).to eql BigDecimal('45.67')
  end
end

