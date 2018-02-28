require 'gilded_rose.rb'
require 'items.rb'
require 'sulfuras.rb'

describe "when dealing with Sulfuras" do

  it "does not decrease in sell_in value" do
    sulfuras = [Sulfuras.new("Sulfuras, Hand of Ragnaros", 1, 80)]
    GildedRose.new(sulfuras).update_quality
    expect(sulfuras[0].sell_in).to eq 1
  end

  it "does not decrease in quality" do
    sulfuras = [Sulfuras.new("Sulfuras, Hand of Ragnaros", 1, 80)]
    GildedRose.new(sulfuras).update_quality
    expect(sulfuras[0].quality).to eq 80
  end
end
