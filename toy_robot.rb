class ToyRobot
  VALID_DIRECTIONS = %w(NORTH EAST SOUTH WEST)

  def initialize(size: 5)
    @size = size
    @x = nil
    @y = nil
    @direction = nil
  end

  attr_reader :x, :y, :direction

  def place(x, y, direction)
    if valid_destination?(x, y) && valid_direction?(direction)
      @x = x
      @y = y
      @direction = direction
    end
  end

  private

  def valid_destination?(x, y)
    x.between?(0, @size - 1) && y.between?(0, @size - 1)
  end

  def valid_direction?(direction)
    VALID_DIRECTIONS.include?(direction)
  end
end
