require "spec_helper"
require File.expand_path('../../app/command_receiver', __FILE__)

describe CommandReceiver do
  let(:input) { File.read(File.expand_path("../test_input.txt", __FILE__)) }
  let(:receiver) { described_class.new(input) }

  it "parces input" do
    expected = [
      "5 5",
      "1 2 N",
      "LMLMLMLMM",
      "3 3 E",
      "MMRMMRMRRM"
    ]

    expect(receiver.commands).to eq(expected)
  end

  it "initializes plateau with correct coordinates and adds rovers to it" do
    plateau = double(rovers: [])
    allow(plateau).to receive(:include?).and_return(true)
    allow(plateau).to receive(:clear?).and_return(true)
    expect(Plateau).to receive(:new).with("5 5").and_return(plateau)

    receiver.process!
  end

  it "initializes rovers and moves them" do
    rover_1 = double
    rover_2 = double
    expect(rover_1).to receive(:process!).with("LMLMLMLMM")
    expect(rover_2).to receive(:process!).with("MMRMMRMRRM")

    expect(Rover).to receive(:new)
      .once
      .ordered
      .with("1 2 N", an_instance_of(Plateau))
      .and_return(rover_1)

    expect(Rover).to receive(:new)
      .once
      .ordered
      .with("3 3 E", an_instance_of(Plateau))
      .and_return(rover_2)

    receiver.process!
  end
end
