class MultiBuyPromotion < Struct.new(:product_code, :discounted_price, :minimum_number)
  def apply_to_total(total)
    total
  end

  def apply_to_price(original_price, item_count)
    item_count >= minimum_number ? discounted_price : original_price
  end
end

