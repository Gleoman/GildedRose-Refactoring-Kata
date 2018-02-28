require 'items'
require 'qualityevaluator'

class GildedRose
  def initialize(items, quality_evaluator)
    @items = items
    @quality_evaluator = quality_evaluator
  end

  def update_quality
    @items.each do |item|
      case item.name
      when "Aged Brie"
        @quality_evaluator.brie(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        @quality_evaluator.pass(item)
      when "Sulfuras, Hand of Ragnaros"
        item
      when "Conjured item"
        @quality_evaluator.conjured(item)
      else
        @quality_evaluator.standard_stock(item)
      end
    end
  end
end
