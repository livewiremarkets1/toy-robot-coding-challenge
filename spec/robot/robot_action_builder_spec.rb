require 'spec_helper'

module RobotSimulator
  describe RobotActionBuilder do
    context "#initialize" do
      it "should be a part of RobotSimulator module" do
        expect(RobotActionBuilder).to be RobotSimulator::RobotActionBuilder
      end
    end

    subject {RobotActionBuilder.new}
    let!(:actions_list_1) {[["PLACE", "3", "0", "NORTH"], ["MOVE"], ["LEFT"], ["REPORT"], ["RIGHT"],
      ["PLACE", "3", "3", "SOUTH"], ["MOVE"], ["MOVE"], ["REPORT"], ["RIGHT"], ["REPORT"], ["REPORT"]]}
    let!(:actions_list_2) {[["PLACE", "1","2","EAST"],["MOVE"],["MOVE"],["LEFT"],["MOVE"],["REPORT"]]}

    context "#perform_actions_list with valid input" do
      it "should perform all the actions" do
        expect(subject.perform_actions_list(actions_list_1)).to eq([3, 1,"WEST"])
      end
      it "should perform all the actions" do
        expect(subject.perform_actions_list(actions_list_2)).to eq([3,3,"NORTH"])
      end
    end

    context "#execute_actions from input file name" do
      it "should perform all the actions and return the final position" do
        input_file_path = File.expand_path(File.expand_path '../../../run_robot/input_files/command_list.txt', __FILE__)
        expect(subject.execute_actions(input_file_path)).to eq([3, 1, "WEST"])
      end
    end

  end
end