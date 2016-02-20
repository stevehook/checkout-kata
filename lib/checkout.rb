require 'bigdecimal'

class Checkout
  attr_reader :total

  ITEMS = {
    '001' => { name: 'Lavender heart', price: BigDecimal('9.25') },
    '002' => { name: 'Personalised cufflinks', price: BigDecimal('45.0') },
    '003' => { name: 'Kids T-shirt', price: BigDecimal('19.95') }
  }

  def initialize(rules)
    @total = BigDecimal('0')
    @rules = rules
  end

  def scan(item_code)
    item = ITEMS[item_code]
    @total += item[:price]
  end
end
