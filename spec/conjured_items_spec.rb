require 'gilded_rose.rb'
require 'items.rb'
require 'conjured.rb'

describe "when dealing with conjured items" do

  it "reduces the quality of the item by 2" do
    std_items = [Conjured.new("Conjured item", 10, 10)]
    GildedRose.new(std_items).update_quality
    expect(std_items[0].quality).to eq 8
	end

  it "reduces the sell_in value of the item by 1" do
    std_items = [Conjured.new("Conjured item", 10, 10)]
    GildedRose.new(std_items).update_quality
    expect(std_items[0].sell_in).to eq 9
  end

  it "once sell_in date passed, it decreases the quality of an item by a reduction of 4" do
    std_items = [Conjured.new("Conjured item", 0, 10)]
    GildedRose.new(std_items).update_quality
    expect(std_items[0].quality).to eq 6
  end

  it "cannot allow an item's quality to be negative" do
    std_items = [Conjured.new("Conjured item", 0, 0)]
    GildedRose.new(std_items).update_quality
    expect(std_items[0].quality).to eq 0
  end
end
