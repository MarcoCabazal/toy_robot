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

end
