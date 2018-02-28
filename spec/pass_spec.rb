require 'gilded_rose.rb'
require 'items.rb'
require 'qualityevaluator.rb'

describe "when dealing with backstage passes" do

  quality_evaluator = QualityEvaluator.new

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
