class Plateau
  attr_reader :width, :height, :rovers

  def initialize(coords)
    @width, @height = coords.split(" ").map(&:to_i)
    @rovers = []
  end

  def include?(x, y)
    x >= 0 && x <= width && y >= 0 && y <= height
  end

  def clear?(x, y)
    rovers.none? { |rover| rover.x == x && rover.y == y }
  end
end
