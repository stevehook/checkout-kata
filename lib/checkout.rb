class Checkout
  attr_reader :total

  def initialize(rules)
    @total = 0
    @rules = rules
  end

  def scan(item_code)
  end
end
