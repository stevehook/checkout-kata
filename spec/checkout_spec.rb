require_relative '../lib/checkout'
require 'bigdecimal'

RSpec.describe Checkout do
  let(:rules) { {} }
  subject { Checkout.new(rules) }

  it 'initial total is zero' do
    expect(subject.total).to eql 0
  end

  it 'can scan items' do
    subject.scan('001')
    expect(subject.total).to eql BigDecimal('9.25')
  end
end
