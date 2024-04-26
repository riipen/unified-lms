# frozen_string_literal: true
require 'webmock'
require 'spec_helper'

RSpec.describe UnifiedLms::Client do
  include_context 'login'

  describe "#get submission" do
    it "Gets a single submission based on course id, assignment id, and user id" do

      #create the mock responce
      mock_response = [{
        assignment_id: 23,
        assignment: nil,
        course: nil,
        attempt: 1,
        posted_at: "2020-01-02T11:10:30Z",
        read_status: "read",
        redo_request: true
      },
     {
       assignment_id: 24,
       assignment: nil,
       course: nil,
       attempt: 1,
       posted_at: "2020-01-02T11:10:30Z",
       read_status: "read",
       redo_request: true
     }]

      stub_request(:get, "https://canvas.instructure.com/api/v1/courses/1/assignments/23/submissions/1?assignment_id=23&course_id=1&user_id=1").
        with(
          headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent'=>'Unified_LMS/0.1.0 (ruby3.2.2)'
          }).
        to_return(status: 200, body: mock_response.to_json, headers: {})

      # make the get submission call
      submissions = client.get_submission(course_id: 1, assignment_id: 23, user_id: 1)

      # validate
      submission = JSON.parse(submissions[0])
      expect(submission['assignment_id']) == 23
      expect(JSON.parse(submissions[1])['assignment_id']) == 24
    end
  end
end
