require 'spec_helper'

module RobotSimulator
  describe CommandParser do
    context "#initialize" do
      it "should be a part of RobotSimulator module" do
        expect(CommandParser).to be RobotSimulator::CommandParser
      end
    end

    subject {CommandParser.new}
    let!(:unfiltered_input) {[["PLACE 3,0"], ["MOVE"], ["LEFT"], ["REPORT"], ["RIGHT"], [], ["000"],
        ["111"], ["1 0 a b"], ["PLACE 3,3,SOUTH"], ["LEFT///"], ["MOVE"], ["MOVE"], [], ["REPORT"], ["dkfjlskdjflksf"],
        ["123123123"], ["MOVE 234234234"], ["RIGHT"], ["khkhkh"], ["~~~~~~~~~~~~@@\#$%&T^*&^*^*&^&*"], ["REPORT"]]}
    let!(:filtered_list) {[["PLACE", "3", "3", "SOUTH"], ["MOVE"], ["MOVE"], ["REPORT"], ["RIGHT"], ["REPORT"]]}

    context "#parse_commands and filter out invalid data" do
      it "should return valid command array" do
        expect(subject.parse_commands(unfiltered_input)).to eq(filtered_list)
      end
    end
  end
end