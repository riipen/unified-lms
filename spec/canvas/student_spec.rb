require 'spec_helper'

RSpec.describe 'Canvas Student' do
  describe '#some_method' do
    it 'does something expected' do
      # Setup
      student = Student.new
      result = student.some_method

      # Verify
      expect(result).to eq(expected_result)
    end
  end
end
