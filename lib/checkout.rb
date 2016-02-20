require 'bigdecimal'
require_relative './checkout/total_spend_promotion'
require_relative './checkout/multi_buy_promotion'

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
    undiscounted_total = @items.inject(0) { |total, next_item| total + price_with_promotions(next_item) }
    apply_promotions_to_total(undiscounted_total)
  end

  private

  def apply_promotions_to_total(undiscounted_total)
    @rules.inject(undiscounted_total) { |last_total, rule| rule.apply_to_total(last_total) }
  end

  def price_with_promotions(checkout_item)
    checkout_item.price
  end
end
