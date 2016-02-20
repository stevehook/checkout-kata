class Checkout
  module BasePromotion
    def apply_to_price(original_price, _)
      original_price
    end

    def apply_to_total(total)
      total
    end
  end
end
