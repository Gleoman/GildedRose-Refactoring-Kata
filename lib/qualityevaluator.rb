
class QualityEvaluator

  INF = 1.0 / 0.0

  def brie(item)
    item.quality += 1 if item.sell_in > 0
    quality_control(item)
    sell_in_control(item)
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
    quality_control(item)
    sell_in_control(item)
  end

  def standard_stock(item)
    item.sell_in > 0 ? item.quality -= 1 : item.quality -= 2
    quality_control(item)
    sell_in_control(item)
  end

  def conjured(item)
    item.sell_in > 0 ? item.quality -= 2 : item.quality -= 4
    quality_control(item)
    sell_in_control(item)
  end

	private

  def quality_control(item)
    if item.quality > 50
      item.quality = 50
    elsif item.quality < 1
      item.quality = 0
    end
  end

  def sell_in_control(item)
    item.sell_in -= 1
  end
end
