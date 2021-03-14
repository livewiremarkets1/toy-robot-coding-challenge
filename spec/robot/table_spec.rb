require 'spec_helper'

module RobotSimulator
  describe Table do
    context "#initialize" do
      it "should be a part of RobotSimulator module" do
        expect(Table).to be RobotSimulator::Table
      end
    end

    subject {Table.new}
    let!(:valid_directions) {%w(NORTH SOUTH EAST WEST)}
    let!(:invalid_directions) {%w(NORTH-EAST this_way further_ahead yonder)}
    let!(:valid_actions) { %w(PLACE MOVE LEFT RIGHT REPORT) }
    let!(:invalid_actions) { %w(lalalal hahaha lol_man jejeje rofl) }

    context "check valid directions" do
      it "should return true" do
        valid_directions.each do |dir|
          expect(subject.is_valid_direction? dir).to be true
        end
      end
      it "should return false" do
        invalid_directions.each do |dir|
          expect(subject.is_valid_direction? dir).to be false
        end
      end
    end

    context "check valid actions" do
      it "should return true" do
        valid_actions.each do |action|
          expect(subject.is_valid_action? action).to be true
        end
      end
      it "should return false" do
        invalid_actions.each do |action|
          expect(subject.is_valid_action? action).to be false
        end
      end
    end

    context "check coordinates are within table" do
      it "should return true" do
        expect(subject.is_within_table?([0,3])).to be true
      end
      it "should return true" do
        expect(subject.is_within_table?([0,4])).to be true
      end
      it "should return true" do
        expect(subject.is_within_table?([2,3])).to be true
      end
      it "should return true" do
        expect(subject.is_within_table?([1,4])).to be true
      end
      it "should return true" do
        expect(subject.is_within_table?([0,5])).to be false
      end
      it "should return true" do
        expect(subject.is_within_table?([0,9])).to be false
      end
      it "should return true" do
        expect(subject.is_within_table?([-1,3])).to be false
      end
      it "should return true" do
        expect(subject.is_within_table?([-1,-3])).to be false
      end
    end

    context "check valid place command" do
      it "should return true" do
        expect(subject.is_valid_place?(['PLACE', 0, 0, 'NORTH'])).to be true
      end
      it "should return true" do
        expect(subject.is_valid_place?(['PLACE', 0, 4, 'EAST'])).to be true
      end
      it "should return true" do
        expect(subject.is_valid_place?(['PLACE', 1, 1, 'WEST'])).to be true
      end
      it "should return true" do
        expect(subject.is_valid_place?(['PLACE', 4, 4, 'NORTH'])).to be true
      end
      it "should return true" do
        expect(subject.is_valid_place?(['PLACE', 0, 0, 'NORTH-WEST'])).to be false
      end
      it "should return true" do
        expect(subject.is_valid_place?(['PLACE', -2, -1, 'EAST'])).to be false
      end
      it "should return true" do
        expect(subject.is_valid_place?(['PLACE', 3, 5, 'EAST'])).to be false
      end
      it "should return true" do
        expect(subject.is_valid_place?(['PLACE', 2, -2, 'NORTH'])).to be false
      end
    end

  end
end