require_relative './toy_robot'

def capture
  original_stdout = $stdout  
  $stdout = StringIO.new 
  yield
  $stdout.string
ensure
  $stdout = original_stdout  # restore $stdout to its previous value
end

RSpec.describe ToyRobot do
  describe 'ToyRobot#initialize' do
    it 'should instantiate a new ToyRobot object' do
      toy_robot = ToyRobot.new
      expect(toy_robot).to be_a ToyRobot
      expect(toy_robot.x).to eq nil
      expect(toy_robot.y).to eq nil
      expect(toy_robot.direction).to eq nil
    end
  end

  describe 'ToyRobot#place' do
    context 'with a valid coordinate' do
      it 'should place the robot on the table' do
        toy_robot = ToyRobot.new
        toy_robot.place(0, 0, 'NORTH')
        expect(toy_robot.x).to eq 0
        expect(toy_robot.y).to eq 0
        expect(toy_robot.direction).to eq 'NORTH'
      end
    end
    
    context 'with a valid coordinate' do
      it 'should place the robot on the table' do
        toy_robot = ToyRobot.new size: 6 
        toy_robot.place(5, 5, 'NORTH')
        expect(toy_robot.x).to eq 5
        expect(toy_robot.y).to eq 5
        expect(toy_robot.direction).to eq 'NORTH'
      end
    end

    context 'with an invalid coordinate' do
      it 'should not place the robot on the table' do
        toy_robot = ToyRobot.new
        toy_robot.place(5, 5, 'NORTH')
        expect(toy_robot.x).to be nil
        expect(toy_robot.y).to be nil
        expect(toy_robot.direction).to be nil
      end
    end
  end

  describe 'ToyRobot#turn_left' do
    it 'should turn the robot left' do
      toy_robot = ToyRobot.new
      toy_robot.place(0, 0, 'NORTH')
      toy_robot.turn_left
      expect(toy_robot.x).to eq 0
      expect(toy_robot.y).to eq 0
      expect(toy_robot.direction).to eq 'WEST'
    end
  end

  describe 'ToyRobot#turn_right' do
    it 'should turn the robot right' do
      toy_robot = ToyRobot.new
      toy_robot.place(0, 0, 'NORTH')
      toy_robot.turn_right
      expect(toy_robot.x).to eq 0
      expect(toy_robot.y).to eq 0
      expect(toy_robot.direction).to eq 'EAST'
    end
  end

  describe 'ToyRobot#move' do
    context 'with a valid destination' do
      it 'should move the robot on the table' do
        toy_robot = ToyRobot.new
        toy_robot.place(0, 0, 'NORTH')
        toy_robot.move
        expect(toy_robot.x).to eq 0
        expect(toy_robot.y).to eq 1
        expect(toy_robot.direction).to eq 'NORTH'
      end
    end

    context 'with an invalid destination' do
      it 'should not move the robot on the table' do
        toy_robot = ToyRobot.new
        toy_robot.place(0, 0, 'SOUTH')
        toy_robot.move
        expect(toy_robot.x).to eq 0
        expect(toy_robot.y).to eq 0
        expect(toy_robot.direction).to eq 'SOUTH'
      end
    end
  end
  
  describe  'ToyRobot#report' do
    it 'should output current position and orientation of robot' do
      toy_robot = ToyRobot.new
      toy_robot.place(0, 0, 'NORTH')
      toy_robot.move
      expect(toy_robot.x).to eq 0
      expect(toy_robot.y).to eq 1
      expect(toy_robot.direction).to eq 'NORTH'
      expect(capture { toy_robot.report }.split("\n")[0]).to eq "Position: 0, 1, NORTH"
    end
  end 
end
