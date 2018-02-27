require 'items'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
			if item.name == "Aged Brie"
				brie(item)
			elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
				pass(item)
			elsif item.name == "Sulfuras, Hand of Ragnaros"
				item
			else
				standard_stock(item)
			end
		end
	end

private

	def brie(item)
		if item.sell_in > 0
			item.quality += 1
		end
		quality(item)
		item.sell_in -= 1
	end

	def pass(item)
		if item.sell_in > 10
			item.quality += 1
		elsif item.sell_in > 5
			item.quality += 2
		elsif item.sell_in > 0
			item.quality += 3
		else
			item.quality = 0
		end
		quality(item)
		item.sell_in -= 1
	end

	def standard_stock(item)
		if item.sell_in > 0
			item.quality -= 1
		elsif item.sell_in <= 0
			item.quality -= 2
		end
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
