require 'gilded_rose.rb'
require 'items.rb'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      std_items = [StandardStock.new("foo", 10, 10)]
      GildedRose.new(std_items).update_quality
      expect(std_items[0].name).to eq "foo"
    end
  end
end
