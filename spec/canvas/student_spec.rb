# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UnifiedLms::Client do
include_context 'login'

  describe '#get_students' do
    it 'returns a list of students from the Canvas LMS' do
      # Setup
      mock_response = [{
        id: 1,
        name: "John Doe"
      },
      {
        id: 2,
        name: "Jane Smith"
      }]

      stub_request(:get, "https://canvas.instructure.com/api/v1/courses/2/users?course_id=2").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Unified_LMS/0.1.0 (ruby3.2.2)'
           }).
         to_return(status: 200, body: mock_response.to_json, headers: {})

      students = client.get_students(course_id: 2)

      student = JSON.parse(students[0])
      student2 = JSON.parse(students[1])

      # Verify
      expect(student['name']) == 'John Doe'
    end
  end

  # More tests
end
