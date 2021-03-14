require 'spec_helper'

module RobotSimulator
  describe Table do
    context "#initialize" do
      it "should be a part of RobotSimulator module" do
        expect(Table).to be RobotSimulator::Table
      end
    end
  end
end