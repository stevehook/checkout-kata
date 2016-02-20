require_relative '../lib/checkout'

RSpec.describe Checkout do
  let(:rules) { {} }
  subject { Checkout.new(rules) }

  it 'initial total is zero' do
    expect(subject.total).to eql 0
  end
end
