class MultiBuyPromotion < Struct.new(:product_code, :discounted_price, :minimum_number)
  def apply_to_total(total)
    total
  end
end

