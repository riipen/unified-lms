

#Example test for get courses method will be implemented later
require 'blackboard'

RSpec.describe Blackboard do
  describe '#get_courses' do
    it 'prints "Hello, world!"' do
      expect { Blackboard.get_courses_test }.to output("Hello, world!\n").to_stdout
    end

    it 'is a placeholder for the actual get_courses method (to be implemented later)' do
      pending("Implement this test later")
    end
  end
end