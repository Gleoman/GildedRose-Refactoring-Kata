require 'items'
require 'brie'
require 'conjured'
require 'pass'
require 'standardstock'
require 'sulfuras'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.update
    end
  end
end
