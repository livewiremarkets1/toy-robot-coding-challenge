module RobotSimulator
  class Robot
    attr_reader :table, :coordinates

    def initialize(options={})
      @table = RobotSimulator::Table.new
      @coordinates = Coordinates.new
    end

    def perform_robot_movement(action_array)
      actions = {
          'PLACE' => method(:place),
          'MOVE' => method(:move),
          'LEFT' => method(:turn_left),
          'RIGHT' => method(:turn_right),
          'REPORT' => method(:report),
      }[action_array.first]
    end

    private

    def place(place_array)
      place_coordinates = place_array[1,2].map(&:to_i)
      place_direction = place_array[3]
      new_coordinates = place_coordinates << place_direction
    end

    def move(current_position)
      new_position = get_new_position(current_position, :move_x, :move_y)
    end

    def turn_left(current_position)
      new_position = turn(current_position,:left)
    end

    def turn_right(current_position)
      new_position = turn(current_position,:right)
    end

    def report(current_positition)
      puts  current_positition.join(',')
      current_positition
    end

    def turn(current_position, turn_sym)
      new_position = current_position.dup
      direction = new_position[2]
      new_position[2] = coordinates.get_coordinates(direction.to_sym, turn_sym)
      new_position
    end

    def get_new_position(current_position, x_sym, y_sym)
      position = current_position.dup
      x, y, direction = position[0], position[1], position[2]
      puts x, y, direction, coordinates.get_coordinates(direction.to_sym, x_sym)
      position[0] = x + coordinates.get_coordinates(direction.to_sym, x_sym)
      position[1] = y + coordinates.get_coordinates(direction.to_sym, y_sym)
      table.is_within_table?(position[0..1]) ? position : current_position
    end
  end
end
