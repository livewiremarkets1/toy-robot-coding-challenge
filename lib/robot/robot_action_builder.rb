module RobotSimulator
  class RobotActionBuilder
    attr_accessor
    def initialize
      @command_parser = RobotSimulator::CommandParser.new
      @robot = RobotSimulator::Robot.new
      @table = RobotSimulator::Table.new
    end

    def execute_actions(command_file_name)
      action_list = get_action_list(command_file_name)
      return if action_list.empty?
      perform_actions_list(action_list)
    end

    def perform_actions_list(action_list)
      current_position = @table.initial_position
      action_list.each do |action|
        if action.first == @table.place_command
          current_position = @robot.perform_robot_movement(action).call(action)
        else
          current_position = @robot.perform_robot_movement(action).call(current_position)
        end
      end
      current_position
    end

    private

    def get_action_list(command_file_name)
      input_command_arr = []
      File.open(command_file_name, "r").each_line do |line|
        data = line.split(/\n/)
        input_command_arr << data
      end
      input_command_list = @command_parser.parse_commands(input_command_arr)
    end
  end
end