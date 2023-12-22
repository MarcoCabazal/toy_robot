class ToyRobot
  VALID_DIRECTIONS = %w(NORTH EAST SOUTH WEST)
  LEFT = -1
  RIGHT = 1

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

    def turn_left
      rotate(LEFT)
    end

    def turn_right
      rotate(RIGHT)
    end
  end

  private

  def valid_destination?(x, y)
    x.between?(0, @size - 1) && y.between?(0, @size - 1)
  end

  def valid_direction?(direction)
    VALID_DIRECTIONS.include?(direction)
  end

  def rotate(direction)
    current_index = VALID_DIRECTIONS.index(@direction)
    new_index = (current_index + direction) % VALID_DIRECTIONS.size
    @direction = VALID_DIRECTIONS[new_index]
  end
end
