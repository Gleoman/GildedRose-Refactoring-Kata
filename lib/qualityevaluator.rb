
class QualityEvaluator

  INF = 1.0 / 0.0

  def brie(item)
    item.quality += 1 if item.sell_in > 0
  end

  def pass(item)
    case item.sell_in
    when 11..INF
      item.quality += 1
    when 6..10
      item.quality += 2
    when 1..5
      item.quality += 3
    else
      item.quality = 0
    end
  end

  def standard_stock(item)
    item.sell_in > 0 ? item.quality -= 1 : item.quality -= 2
  end

  def conjured(item)
    item.sell_in > 0 ? item.quality -= 2 : item.quality -= 4
  end
end
