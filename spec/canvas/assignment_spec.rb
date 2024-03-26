require 'spec_helper'

RSpec.describe CanvasClient do
    describe '#get assignments' do
      it 'return assignment list from the Canvas LMS' do
        # Setup
        canvas_client = CanvasClient.new
        course_id = 123
        mock_response = [
          {'id' => 1, 'name' => 'Assignment 1', 'description' => 'Assignment 1', 'course_id' => course_id},
          {'id' => 2, 'name' => 'Assignment 2', 'description' => 'Assignment 2', 'course_id' => course_id}
        ]
        allow(canvas_client).to receive(:get_assignments).with(course_id).and_return(mock_response)

        assignments = canvas_client.get_assignments(course_id)
  
        # Verify
        expect(assignments).to be_an(Array)
        expect(assignments.length).to eq(2)
        expect(assignments.first['id']).to eq(1)
      end
    end
  end