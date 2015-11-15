require "spec_helper"
require File.expand_path('../../app/plateau', __FILE__)

describe Plateau do
  let(:plateau) { Plateau.new("5 5") }

  it "initializes dimensions" do
    expect(plateau.width).to eq(5)
    expect(plateau.height).to eq(5)
  end

  describe "#include?" do
    it "returns true if coordinates are in bounds of plateau" do
      expect(plateau.include?(0, 0)).to eq(true)
      expect(plateau.include?(3, 3)).to eq(true)
      expect(plateau.include?(5, 5)).to eq(true)
    end

    it "returns false if coordinates are out of bounds of plateau" do
      expect(plateau.include?(6, 3)).to eq(false)
      expect(plateau.include?(-1, 3)).to eq(false)
    end
  end

  describe "#include?" do
    it "returns true if coordinates are in bounds of plateau" do
      expect(plateau.include?(0, 0)).to eq(true)
      expect(plateau.include?(3, 3)).to eq(true)
      expect(plateau.include?(5, 5)).to eq(true)
    end

    it "returns false if coordinates are out of bounds of plateau" do
      expect(plateau.include?(6, 3)).to eq(false)
      expect(plateau.include?(-1, 3)).to eq(false)
    end
  end

  describe "#include?" do
    it "returns true if coordinates are in bounds of plateau" do
      expect(plateau.include?(0, 0)).to eq(true)
      expect(plateau.include?(3, 3)).to eq(true)
      expect(plateau.include?(5, 5)).to eq(true)
    end

    it "returns false if coordinates are out of bounds of plateau" do
      expect(plateau.include?(6, 3)).to eq(false)
      expect(plateau.include?(-1, 3)).to eq(false)
    end
  end

  describe "#clear?" do
    before do
      rover_1 = double(x: 1, y: 2)
      rover_2 = double(x: 5, y: 5)
      plateau.rovers << rover_1
      plateau.rovers << rover_2
    end

    it "returns true if coordinates are clear from rovers" do
      expect(plateau.clear?(0, 0)).to eq(true)
      expect(plateau.clear?(1, 3)).to eq(true)
    end

    it "returns false if some rover is already occupied coordinates" do
      expect(plateau.clear?(1, 2)).to eq(false)
      expect(plateau.clear?(5, 5)).to eq(false)
    end
  end
end
