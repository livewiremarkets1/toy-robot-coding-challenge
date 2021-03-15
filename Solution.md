#Solution
  
  Run rspec unit tests:
  -----------
    
  ```
  cd robot-simulator
    
  gem install bundler -v 2.1.4
    
  bundle install --path .bundle
    
  bundle exec rspec
        
  ```
  
  Run the example:
  -----------
  ```
  cd robot-simulator
  
  ruby run_robot/run_robot.rb
  
  ```
  
  Input file location
  --------
  run_robot/input_files/command_list.txt
  
  The code
  -----------
  The code reads an input file in .txt format in the folder 'run_robot/input_files'. Each instruction is on a new line.
  The file run_robot.rb reads the input file and starts the execution of the robot program.
  
  The following are the parts of the robot program:
  
  **Table**: This class defines the table on which the robot moves around. The size of the table is set here. It also defines and 
  checks the validity of the actions performed by the robot.
  
  **RobotActionBuilder**  This class reads the input .txt file, reads the robot action commands and formats them so that the rest
  of the code can iterate over it.
  
  **CommandParser** This code parses the robot action commands, filters out the invalid commands following the specific set
  of requirements in the problem statement. It returns the valid set of commands the program can safely execute.
  
  **Coordinates** Since the robot movements make use of cardinal directions, this class helps the rest of the code to work
  with cardinal directions and their relationships with each other.
  
  **Robot** This class executes the actual commands which were already checked for validity before being passed on to this 
  class. It still checks for a valid location since an action could result in the robot being outside the set limits of the
  table.
 