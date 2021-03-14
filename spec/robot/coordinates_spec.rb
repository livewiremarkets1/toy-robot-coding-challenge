require 'spec_helper'

module RobotSimulator
  describe Coordinates do
    subject {Coordinates.new}
    context "#initialize" do
      it "should be a part of RobotSimulator module" do
        expect(Coordinates).to be RobotSimulator::Coordinates
      end
    end

    context 'turn robot in various directions' do
      it 'north facing robot left' do
        expect(subject.get_coordinates(:NORTH, :left)).to eq('WEST')
      end
      it 'north facing robot right' do
        expect(subject.get_coordinates(:NORTH, :right)).to eq('EAST')
      end
      it 'south facing robot left' do
        expect(subject.get_coordinates(:SOUTH, :left)).to eq('EAST')
      end
      it 'south robot right' do
        expect(subject.get_coordinates(:SOUTH, :right)).to eq('WEST')
      end
      it 'east facing robot left' do
        expect(subject.get_coordinates(:EAST, :left)).to eq('NORTH')
      end
      it 'east facing robot right' do
        expect(subject.get_coordinates(:EAST, :right)).to eq('SOUTH')
      end
      it 'west facing robot left' do
        expect(subject.get_coordinates(:WEST, :left)).to eq('SOUTH')
      end
      it 'west facing robot right' do
        expect(subject.get_coordinates(:WEST, :right)).to eq('NORTH')
      end
    end

    context 'move robot one unit in various directions' do
      it 'north facing robot x' do
        expect(subject.get_coordinates(:NORTH, :move_x)).to eq(0)
      end
      it 'north facing robot y' do
        expect(subject.get_coordinates(:NORTH, :move_y)).to eq(1)
      end
      it 'south facing robot x' do
        expect(subject.get_coordinates(:SOUTH, :move_x)).to eq(0)
      end
      it 'south facing robot y' do
        expect(subject.get_coordinates(:SOUTH, :move_y)).to eq(-1)
      end
      it 'east facing robot x' do
        expect(subject.get_coordinates(:EAST, :move_x)).to eq(1)
      end
      it 'east facing robot y' do
        expect(subject.get_coordinates(:EAST, :move_y)).to eq(0)
      end
      it 'west facing robot x' do
        expect(subject.get_coordinates(:WEST, :move_x)).to eq(-1)
      end
      it 'west facing robot y' do
        expect(subject.get_coordinates(:WEST, :move_y)).to eq(0)
      end
    end
  end
end