module RobotSimulator
  class Coordinates
    def get_coordinates(direction, action_val)
      {
          :NORTH => {
              move_x: 0,
              move_y: 1,
              left: 'WEST',
              right: 'EAST'
          },
          :SOUTH => {
              move_x: 0,
              move_y: -1,
              left: 'EAST',
              right: 'WEST'
          },
          :WEST => {
              move_x: -1,
              move_y: 0,
              left: 'SOUTH',
              right: 'NORTH'
          },
          :EAST => {
              move_x: 1,
              move_y: 0,
              left: 'NORTH',
              right: 'SOUTH'
          }
      }[direction][action_val]
    end
  end
end