class Rover
  ACCEPTABLE_COMMANDS = %w(R L M)
  COMMANDS_MAPPING = {
    "R" => :turn_right!,
    "L" => :turn_left!,
    "M" => :move_forward!
  }

  DIRECTIONS = %w(N E S W)

  attr_reader :plateau
  attr_accessor :x, :y, :direction

  def initialize(state, plateau)
    @x, @y, @direction = state.split(" ")
    @x = @x.to_i
    @y = @y.to_i
    @plateau = plateau
  end

  def process!(commands)
    commands.each_char do |command|
      raise ArgumentError, "`#{command}` is unacceptable command" unless ACCEPTABLE_COMMANDS.include?(command)

      send(COMMANDS_MAPPING[command])
    end
  end

  def to_s
    "#{x} #{y} #{direction}"
  end

  private

  def turn_right!
    self.direction = case direction
      when "N" then "E"
      when "E" then "S"
      when "S" then "W"
      when "W" then "N"
    end
  end

  def turn_left!
    self.direction = case direction
      when "N" then "W"
      when "W" then "S"
      when "S" then "E"
      when "E" then "N"
    end
  end

  def move_forward!
    x_shift, y_shift = case direction
      when "N" then [0, 1]
      when "E" then [1, 0]
      when "S" then [0, -1]
      when "W" then [-1, 0]
    end

    new_x = x + x_shift
    new_y = y + y_shift

    unless plateau.include?(new_x, new_y)
      raise ArgumentError, "`#{new_x}, #{new_y}` is out of plateau bounds"
    end

    unless plateau.clear?(new_x, new_y)
      raise ArgumentError, "`#{new_x}, #{new_y}` is already occupied by another rover"
    end

    self.x = new_x
    self.y = new_y
  end
end
