module RobotSimulator
  class Table
    attr_accessor :place_command, :initial_position
    def initialize(options={})
      default_table_width, default_table_height = 5, 5
      @table_width = options[:width] || default_table_width
      @table_height = options[:height] || default_table_height
      @valid_actions = %w(PLACE MOVE LEFT RIGHT REPORT)
      @valid_directions = %w(NORTH SOUTH EAST WEST)
      @place_command = 'PLACE'
      @initial_position = [0,0,'NORTH']
    end

    def is_within_table?(coordinates_array)
      return false unless is_valid_array? coordinates_array
      return false unless coordinates_array.all? {|i| is_integer_string? i.to_s }
      coordinates_array = coordinates_array.map(&:to_i)
      x_axis, y_axis = coordinates_array[0], coordinates_array[1]
      x_axis.between?(0, @table_width - 1) && y_axis.between?(0, @table_height - 1)
    end

    def is_valid_place?(place_command)
      return false unless is_valid_array?place_command
      return false unless place_command.length == 4
      return false unless place_command.first == @place_command
      return false unless is_valid_direction? place_command.last
      place_coordinates = place_command[1..2]
      is_within_table? place_coordinates
    end

    def is_valid_action?(action)
      @valid_actions.include? action
    end

    def is_valid_direction?(direction)
      @valid_directions.include? direction
    end

    def is_valid_array?(array)
      array && array.kind_of?(Array)
    end

    def is_integer_string?(string)
      /\A[-+]?\d+\z/ === string
    end

  end
end