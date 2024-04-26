require 'spec_helper'

RSpec.describe UnifiedLms::Client do
  include_context 'login'
    describe '#get assignments' do
      it 'return assignment list from the Canvas LMS' do
        # Setup
        course_id = 123
        mock_response = [
          {id: 1, name: "Assignment 1", description: "Assignment 1", course_id: course_id},
          {id: 2, name: "Assignment 2", description: "Assignment 2", course_id: course_id}
        ]

        stub_request(:get, "https://canvas.instructure.com/api/v1/courses/123/assignments?course_id=123").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Unified_LMS/0.1.0 (ruby3.2.2)'
           }).
         to_return(status: 200, body: mock_response.to_json, headers: {})

        assignments = client.get_assignments(course_id: 123)

        assignment = JSON.parse(assignments[0])
        assignment2 = JSON.parse(assignments[1])

        # Verify
        expect(assignment['id']) == 1
        expect(assignment['name']) == "Assignment 1"
        expect(assignment['course_id']) == 123
        expect(assignment2['id']) == 2
        expect(assignment2['name']) == "Assignment 2"
        expect(assignment2['course_id']) == 123

      end
    end
  end
