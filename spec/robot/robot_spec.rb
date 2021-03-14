require 'spec_helper'

module RobotSimulator
  describe Robot do
    context "#initialize" do
      it "should be a part of RobotSimulator module" do
        expect(Robot).to be RobotSimulator::Robot
      end
    end

    subject {Robot.new}

    context "#perform_robot_movement with valid input" do
      it "should return new coordinates" do
        expect(subject.perform_robot_movement(['PLACE']).call(['PLACE',0,1,'NORTH'])).to eq([0,1,'NORTH'])
      end
      it "should return new coordinates" do
        expect(subject.perform_robot_movement(['MOVE']).call([0,1,'NORTH'])).to eq([0,2,'NORTH'])
      end
      it "should return new coordinates" do
        expect(subject.perform_robot_movement(['LEFT']).call([1,1,'SOUTH'])).to eq([1,1,'EAST'])
      end
      it "should return new coordinates" do
        expect(subject.perform_robot_movement(['RIGHT']).call([3,3,'WEST'])).to eq([3,3,'NORTH'])
      end
    end
  end
end