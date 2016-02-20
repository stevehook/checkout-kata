require 'bigdecimal'
require_relative './checkout/total_spend_promotion'

class Checkout
  CheckoutItem = Struct.new(:product_code, :name, :price)
  ITEMS = {
    '001' => CheckoutItem.new('001', 'Lavender heart', BigDecimal('9.25')),
    '002' => CheckoutItem.new('002', 'Personalised cufflinks', BigDecimal('45.0')),
    '003' => CheckoutItem.new('003', 'Kids T-shirt', BigDecimal('19.95'))
  }

  def initialize(rules)
    @items = []
    @rules = rules
  end

  def scan(item_code)
    @items << ITEMS[item_code]
  end

  def total
    @items.inject(0) { |total, next_item| total + next_item.price }
  end
end
