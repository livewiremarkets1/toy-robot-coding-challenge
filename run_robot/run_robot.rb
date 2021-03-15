require_relative "../lib/robot.rb"

input_file_path = File.expand_path(File.dirname(__FILE__))
input_file_folder = 'input_files'
input_file = File.join(input_file_path, input_file_folder, 'command_list.txt')

action_builder = RobotSimulator::RobotActionBuilder.new
action_builder.execute_actions(input_file)

