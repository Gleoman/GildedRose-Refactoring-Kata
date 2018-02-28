
class Pass < Item

  INF = 1.0/0.0

  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def update
    case self.sell_in
    when 11..INF
      self.quality += 1
    when 6..10
      self.quality += 2
    when 1..5
      self.quality += 3
    else
      self.quality = 0
    end
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
