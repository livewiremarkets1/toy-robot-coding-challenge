module RobotSimulator
  class CommandParser
    attr_accessor :table

    def initialize(options = {})
      @table = RobotSimulator::Table.new
    end
    def parse_commands(command_array)
      command_array = command_array.select{|arr| arr.length > 0}
      return command_array if command_array.empty?
      command_array = command_array.map do |comm|
        comm =  parse_place_command(comm) if comm.first.index(table.place_command)
        comm
      end
      filtered_command_array = filter_valid_commands(command_array)
    end

    private

    def filter_valid_commands(command_array)
      command_array = command_array.select do |arr|
        next unless table.is_valid_action? arr.first
        if arr.first == table.place_command
          next unless table.is_valid_place?(arr)
        end
        true
      end
      valid_place_index = get_first_place_index(command_array)
      return [] unless valid_place_index
      command_array[valid_place_index..-1]
    end

    def get_first_place_index(command_array)
      command_array.map(&:first).index(table.place_command)
    end

    def parse_place_command(place_command)
      place_command.first.split(/[ ,]/).flatten.reject(&:empty?)
    end
  end
end