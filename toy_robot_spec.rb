require_relative './toy_robot'

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
end
