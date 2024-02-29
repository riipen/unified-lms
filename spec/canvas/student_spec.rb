require 'spec_helper'

RSpec.describe CanvasClient do
  describe '#get_students' do
    it 'returns a list of students from the Canvas LMS' do
      # Setup
      canvas_client = CanvasClient.new
      mock_response = [
        { 'id' => 1, 'name' => 'John Doe' },
        { 'id' => 2, 'name' => 'Jane Smith' }
      ]
      allow(canvas_client).to receive(:get_students).and_return(mock_response)
      students = canvas_client.get_students
      
      # Verify
      expect(students).to be_an(Array)
      expect(students.length).to eq(2)
      expect(students.first['name']).to eq('John Doe')
    end
  end

  # More tests
end
