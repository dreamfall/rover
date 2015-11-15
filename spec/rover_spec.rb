require "spec_helper"
require File.expand_path('../../app/plateau', __FILE__)
require File.expand_path('../../app/rover', __FILE__)

describe Rover do
  let(:plateau) { Plateau.new("5 5") }
  let(:rover) { Rover.new("1 2 N", plateau) }
  let(:another_rover) { Rover.new("3 3 E", plateau) }

  before do
    plateau.rovers << rover
    plateau.rovers << another_rover
  end

  it "assigns correct coordinates and directions on initialization" do
    expect(rover.x).to eq(1)
    expect(rover.y).to eq(2)
    expect(rover.direction).to eq("N")
  end

  it "processes movement commands" do
    rover.process!("LMLMLMLMM")
    expect(rover.x).to eq(1)
    expect(rover.y).to eq(3)
    expect(rover.direction).to eq("N")
  end

  describe "#to_s" do
    it "returns state of the rover" do
      expect(rover.to_s).to eq("1 2 N")
    end
  end

  context "edge cases" do
    it "raises error if rover goes out of plateau bounds" do
      expect { rover.process!("MMMM") }.to raise_error(ArgumentError, "`1, 6` is out of plateau bounds")
    end

    it "raises error if rover tries to move to an occupied coordinates" do
      expect { rover.process!("MRMM") }.to raise_error(ArgumentError, "`3, 3` is already occupied by another rover")
    end

    it "raises error if command is incorrect" do
      expect { rover.process!("MRMK") }.to raise_error(ArgumentError, "`K` is unacceptable command")
    end
  end
end
