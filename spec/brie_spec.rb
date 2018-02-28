require 'gilded_rose.rb'
require 'items.rb'
require 'qualityevaluator.rb'

describe "when dealing with Aged Brie" do

  quality_evaluator = QualityEvaluator.new

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
