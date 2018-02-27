require 'rspec'
require 'gilded_rose.rb'
require 'pry'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
			std_items = [Item.new("foo", 10, 10)]
      GildedRose.new(std_items).update_quality()
      expect(std_items[0].name).to eq "foo"
    end

		context "when dealing with standard stock" do
			it "reduces the quality of the item by 1" do
				std_items = [Item.new("foo", 10, 10)]
				GildedRose.new(std_items).update_quality()
				expect(std_items[0].quality).to eq 9
			end

			it "reduces the sell_in value of the item by 1" do
				std_items = [Item.new("foo", 10, 10)]
				GildedRose.new(std_items).update_quality()
				expect(std_items[0].sell_in).to eq 9
			end

			it "once sell_in date passed, reduces the quality of an item by a factor of 2" do
				std_items = [Item.new("foo", 0, 10)]
				GildedRose.new(std_items).update_quality()
				expect(std_items[0].quality).to eq 8
			end

			it "cannot allow an item's quality to be negative" do
				std_items = [Item.new("foo", 0, 0)]
				GildedRose.new(std_items).update_quality()
				expect(std_items[0].quality).to eq 0
			end
		end

		context "when dealing with Aged Brie" do
			it "increases in quality as its sell_in value decreases" do
				brie = [Item.new("Aged Brie", 10, 10)]
				GildedRose.new(brie).update_quality()
				expect(brie[0].quality).to eq 11
			end

			it "cannot increase in quality above 50" do
				brie = [Item.new("Aged Brie", 10, 50)]
				GildedRose.new(brie).update_quality()
				expect(brie[0].quality).to eq 50
			end
		end

		context "when dealing with Sulfuras" do
			it "does not decrease in sell_in value" do
				sulfuras = [Item.new("Sulfuras, Hand of Ragnaros", 1, 50)]
				GildedRose.new(sulfuras).update_quality()
				expect(sulfuras[0].sell_in).to eq 1
			end

			it "does not decrease in quality" do
				sulfuras = [Item.new("Sulfuras, Hand of Ragnaros", 1, 50)]
				GildedRose.new(sulfuras).update_quality()
				expect(sulfuras[0].quality).to eq 50
			end
		end
	end
end
