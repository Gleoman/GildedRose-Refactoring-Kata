require 'gilded_rose.rb'
require 'items.rb'
require 'brie.rb'

describe "when dealing with Aged Brie" do

  it "increases in quality as its sell_in value decreases" do
    brie = [Brie.new("Aged Brie", 10, 10)]
    GildedRose.new(brie).update_quality
    expect(brie[0].quality).to eq 11
  end

  it "cannot increase in quality above 50" do
    brie = [Brie.new("Aged Brie", 10, 50)]
    GildedRose.new(brie).update_quality
    expect(brie[0].quality).to eq 50
  end
end
