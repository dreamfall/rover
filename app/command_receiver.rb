require_relative 'plateau'
require_relative 'rover'

class CommandReceiver
  attr_reader :commands

  def initialize(input)
    @commands = input.lines.map(&:strip)
  end

  def process!
    plateau = Plateau.new(commands.shift)

    commands.each_slice(2) do |rover_commands|
      rover = Rover.new(rover_commands[0], plateau)
      rover.process!(rover_commands[1])
      plateau.rovers << rover
    end

    if ENV["TEST"] != "true"
      plateau.rovers.each do |rover|
        puts rover.to_s
      end
    end
  end
end
