# frozen_string_literal: true

describe CanvasClient do
  describe "#get submission" do
    it "Gets a single submission based on course id, assignment id, and user id" do

      #set up client
      client = CanvasClient.new

      #create the mock responce
      mock_response = '{
        "assignment_id": 23,
        "assignment": null,
        "course": null,
        "attempt": 1,
        "posted_at": "2020-01-02T11:10:30Z",
        "read_status": "read",
        "redo_request": true
      }'

      # make the get submission call
      submissions = client.get_submission(course_id: 1, assignment_id: 23, user_id: 1)

      # validate
      expect(submission["assignment_id"]).to eq(23)
      expect(submission["attempt"]).to eq(1)
      expect(submission["read_status"]).to eq("read")
      expect(submission["redo_request"]).to eq("true")
    end
  end
end
