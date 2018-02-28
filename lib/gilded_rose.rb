require 'items'
require 'qualityevaluator'

class GildedRose
  def initialize(items, quality_evaluator)
    @items = items
    @quality_evaluator = quality_evaluator
  end

  def update_quality
    @items.each do |item|
      if item.name == "Sulfuras, Hand of Ragnaros"
        item
      else
        case item.name
        when "Aged Brie"
          @quality_evaluator.brie(item)
        when "Backstage passes to a TAFKAL80ETC concert"
          @quality_evaluator.pass(item)
        when "Conjured item"
          @quality_evaluator.conjured(item)
        else
          @quality_evaluator.standard_stock(item)
        end
        quality_control(item)
        sell_in_control(item)
      end
    end
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
