require 'gilded_rose.rb'
require 'items.rb'
require 'qualityevaluator.rb'

describe GildedRose do

  quality_evaluator = QualityEvaluator.new

  describe "#update_quality" do
    it "does not change the name" do
      std_items = [Item.new("foo", 10, 10)]
      GildedRose.new(std_items, quality_evaluator).update_quality
      expect(std_items[0].name).to eq "foo"
    end
  end
end
