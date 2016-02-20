class TotalSpendPromotion < Struct.new(:total_spend, :percentage_discount)
  def apply_to_total(total)
    total > total_spend ? discount_total(total) : total
  end

  private

  def discount_total(total)
    (total * (100 - percentage_discount)) / 100
  end
end
