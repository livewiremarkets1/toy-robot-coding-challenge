require 'spec_helper'

module RobotSimulator
  describe Coordinates do
    context "#initialize" do
      it "should be a part of RobotSimulator module" do
        expect(Coordinates).to be RobotSimulator::Coordinates
      end
    end
  end
end