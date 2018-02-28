require 'rspec'
require 'gilded_rose.rb'

describe GildedRose do

	quality_evaluator = QualityEvaluator.new

	describe "#update_quality" do
    it "does not change the name" do
			std_items = [Item.new("foo", 10, 10)]
      GildedRose.new(std_items, quality_evaluator).update_quality
      expect(std_items[0].name).to eq "foo"
    end

		context "when dealing with standard stock" do
			it "reduces the quality of the item by 1" do
				std_items = [Item.new("Standard stock", 10, 10)]
				GildedRose.new(std_items, quality_evaluator).update_quality
				expect(std_items[0].quality).to eq 9
			end

			it "reduces the sell_in value of the item by 1" do
				std_items = [Item.new("Standard stock", 10, 10)]
				GildedRose.new(std_items, quality_evaluator).update_quality
				expect(std_items[0].sell_in).to eq 9
			end

			it "once sell_in date passed, it decreases the quality of an item by a reduction of 2" do
				std_items = [Item.new("Standard stock", 0, 10)]
				GildedRose.new(std_items, quality_evaluator).update_quality
				expect(std_items[0].quality).to eq 8
			end

			it "cannot allow an item's quality to be negative" do
				std_items = [Item.new("Standard stock", 0, 0)]
				GildedRose.new(std_items, quality_evaluator).update_quality
				expect(std_items[0].quality).to eq 0
			end
		end

		context "when dealing with Aged Brie" do
			it "increases in quality as its sell_in value decreases" do
				brie = [Item.new("Aged Brie", 10, 10)]
				GildedRose.new(brie, quality_evaluator).update_quality
				expect(brie[0].quality).to eq 11
			end

			it "cannot increase in quality above 50" do
				brie = [Item.new("Aged Brie", 10, 50)]
				GildedRose.new(brie, quality_evaluator).update_quality
				expect(brie[0].quality).to eq 50
			end
		end

		context "when dealing with Sulfuras" do
			it "does not decrease in sell_in value" do
				sulfuras = [Item.new("Sulfuras, Hand of Ragnaros", 1, 80)]
				GildedRose.new(sulfuras, quality_evaluator).update_quality
				expect(sulfuras[0].sell_in).to eq 1
			end

			it "does not decrease in quality" do
				sulfuras = [Item.new("Sulfuras, Hand of Ragnaros", 1, 80)]
				GildedRose.new(sulfuras, quality_evaluator).update_quality
				expect(sulfuras[0].quality).to eq 80
			end
		end

		context "when dealing with backstage passes" do
			it "increases in quality by 1 when 11 days or more of sell_in value left" do
				backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 10)]
				GildedRose.new(backstage_pass, quality_evaluator).update_quality
				expect(backstage_pass[0].quality).to eq 11
			end

			it "increases in quality by 2 when 10 days of sell_in value left" do
				backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
				GildedRose.new(backstage_pass, quality_evaluator).update_quality
				expect(backstage_pass[0].quality).to eq 12
			end

			it "increases in quality by 2 when 6 days of sell_in value left" do
				backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 10)]
				GildedRose.new(backstage_pass, quality_evaluator).update_quality
				expect(backstage_pass[0].quality).to eq 12
			end

			it "increases in quality by 3 when 5 days of sell_in value left" do
				backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
				GildedRose.new(backstage_pass, quality_evaluator).update_quality
				expect(backstage_pass[0].quality).to eq 13
			end

			it "increases in quality by 3 when 1 day of sell_in value left" do
				backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 10)]
				GildedRose.new(backstage_pass, quality_evaluator).update_quality
				expect(backstage_pass[0].quality).to eq 13
			end

			it "cannot increase in quality above 50 when incrementing by units of 1" do
				backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 50)]
				GildedRose.new(backstage_pass, quality_evaluator).update_quality
				expect(backstage_pass[0].quality).to eq 50
			end

			it "cannot increase in quality above 50 when incrementing by units of 2" do
				backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 49)]
				GildedRose.new(backstage_pass, quality_evaluator).update_quality
				expect(backstage_pass[0].quality).to eq 50
			end


			it "cannot increase in quality above 50 when incrementing by units of 3" do
				backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 49)]
				GildedRose.new(backstage_pass, quality_evaluator).update_quality
				expect(backstage_pass[0].quality).to eq 50
			end

			it "decreases in quality to 0 when sell_in value reaches 0" do
				backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 50)]
				GildedRose.new(backstage_pass, quality_evaluator).update_quality
				expect(backstage_pass[0].quality).to eq 0
			end
		end

		context "when dealing with conjured items" do
			it "reduces the quality of the item by 2" do
				std_items = [Item.new("Conjured item", 10, 10)]
				GildedRose.new(std_items, quality_evaluator).update_quality
				expect(std_items[0].quality).to eq 8
			end

			it "reduces the sell_in value of the item by 1" do
				std_items = [Item.new("Conjured item", 10, 10)]
				GildedRose.new(std_items, quality_evaluator).update_quality
				expect(std_items[0].sell_in).to eq 9
			end

			it "once sell_in date passed, it decreases the quality of an item by a reduction of 4" do
				std_items = [Item.new("Conjured item", 0, 10)]
				GildedRose.new(std_items, quality_evaluator).update_quality
				expect(std_items[0].quality).to eq 6
			end

			it "cannot allow an item's quality to be negative" do
				std_items = [Item.new("Conjured item", 0, 0)]
				GildedRose.new(std_items, quality_evaluator).update_quality
				expect(std_items[0].quality).to eq 0
			end
		end
	end
end
