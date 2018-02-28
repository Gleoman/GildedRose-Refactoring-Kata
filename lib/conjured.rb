
class Conjured < Item

  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

	def update
    self.sell_in > 0 ? self.quality -= 2 : self.quality -= 4
    quality_control
    sell_in_control
  end

  private

  def quality_control
    if self.quality > 50
      self.quality = 50
    elsif self.quality < 1
      self.quality = 0
    end
  end

  def sell_in_control
    self.sell_in -= 1
  end
end
