require 'spec_helper'

module RobotSimulator
  describe RobotActionBuilder do
    context "#initialize" do
      it "should be a part of RobotSimulator module" do
        expect(RobotActionBuilder).to be RobotSimulator::RobotActionBuilder
      end
    end
  end
end