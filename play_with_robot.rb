#!/usr/bin/env ruby

require './toy_robot'

def play_with_robot(robot, commands)
  commands.each do | command |
    case command
    when /PLACE/
      (x, y, direction) = command.split(" ")[1..-1]
      puts "Placing robot at #{x}, #{y}, facing #{direction}"
      robot.place(x.to_i, y.to_i, direction)
    when 'LEFT'
      puts "Turning left"
      robot.turn_left
    when 'RIGHT'
      puts "Turning right"
      robot.turn_right
    when 'MOVE'
      puts "Moving forward"
      robot.move
      robot.report
    when 'REPORT'
      robot.report
    end
  end
end

robot = ToyRobot.new
# spzcify size: if you want a bigger table: 
# robot = ToyRobot.new(size: 10) 

commands = [
  'PLACE 0 0 NORTH',
  'MOVE',
  'RIGHT',
  'MOVE',
  'MOVE',
  'LEFT',
  'LEFT',
  'MOVE',
]

play_with_robot(robot, commands)
