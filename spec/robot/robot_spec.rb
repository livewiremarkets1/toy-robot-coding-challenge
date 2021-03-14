require 'spec_helper'

module RobotSimulator
  describe Robot do
    context "#initialize" do
      it "should be a part of RobotSimulator module" do
        expect(Robot).to be RobotSimulator::Robot
      end
    end
  end
end