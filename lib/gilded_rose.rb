require 'items'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
			case item.name
			when "Aged Brie"
				brie(item)
			when "Backstage passes to a TAFKAL80ETC concert"
				pass(item)
			when "Sulfuras, Hand of Ragnaros"
				item
			when "Conjured item"
				conjured(item)
			else
				standard_stock(item)
			end
		end
	end

	private

	def brie(item)
		item.quality += 1 if item.sell_in > 0
		quality(item)
		item.sell_in -= 1
	end

INF = 1.0/0.0

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
		quality(item)
		item.sell_in -= 1
	end

	def standard_stock(item)
		item.sell_in > 0 ? item.quality -= 1 : item.quality -= 2
		quality(item)
		item.sell_in -= 1
	end

	def conjured(item)
		item.sell_in > 0 ? item.quality -= 2 : item.quality -= 4
		quality(item)
		item.sell_in -= 1
	end

	def quality(item)
		if item.quality > 50
			item.quality = 50
		elsif item.quality < 1
			item.quality = 0
		end
	end
end
