require_relative '../../lib/checkout'

RSpec.describe Checkout::MultiBuyPromotion do
  subject { described_class.new('123', BigDecimal('9.99'), 3) }
  let(:undiscounted_price) { BigDecimal('14.99') }

  it 'applies to matching item when the count equals the minimum' do
    expect(subject.apply_to_price(undiscounted_price, 3)).to eql subject.discounted_price
  end

  it 'applies to matching item when the count exceeds the minimum' do
    expect(subject.apply_to_price(undiscounted_price, 4)).to eql subject.discounted_price
  end

  it 'does not apply to matching item when the count is less than the minimum' do
    expect(subject.apply_to_price(undiscounted_price, 2)).to eql undiscounted_price
  end

  it 'does not apply discount to total' do
    expect(subject.apply_to_total(BigDecimal('45.67'))).to eql BigDecimal('45.67')
  end
end
