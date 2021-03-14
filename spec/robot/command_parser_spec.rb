require 'spec_helper'

module RobotSimulator
  describe CommandParser do
    context "#initialize" do
      it "should be a part of RobotSimulator module" do
        expect(CommandParser).to be RobotSimulator::CommandParser
      end
    end
  end
end