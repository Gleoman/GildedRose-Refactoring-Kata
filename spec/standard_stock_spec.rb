require 'gilded_rose.rb'
require 'items.rb'
require 'standardstock.rb'

describe "when updating standard stock" do

  it "reduces the quality of the item by 1" do
    std_items = [StandardStock.new("Standard stock", 10, 10)]
    GildedRose.new(std_items).update_quality
    expect(std_items[0].quality).to eq 9
  end

  it "reduces the sell_in value of the item by 1" do
    std_items = [StandardStock.new("Standard stock", 10, 10)]
    GildedRose.new(std_items).update_quality
    expect(std_items[0].sell_in).to eq 9
  end

  it "once sell_in date passed, it decreases the quality of an item by a reduction of 2" do
    std_items = [StandardStock.new("Standard stock", 0, 10)]
    GildedRose.new(std_items).update_quality
    expect(std_items[0].quality).to eq 8
  end

  it "cannot allow an item's quality to be negative" do
    std_items = [StandardStock.new("Standard stock", 0, 0)]
    GildedRose.new(std_items).update_quality
    expect(std_items[0].quality).to eq 0
  end
end
