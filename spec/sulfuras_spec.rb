require 'gilded_rose.rb'
require 'items.rb'
require 'qualityevaluator.rb'

describe "when dealing with Sulfuras" do

  quality_evaluator = QualityEvaluator.new

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
