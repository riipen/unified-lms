# frozen_string_literal: true

describe CanvasClient do
  describe "#get announcements" do
    it "Retrieves the announcements for a course" do
      # Set up the client
      client = CanvasClient.new

      # create the mock responce
      mock_response = '{
        [{
          "id":1,
          "title": "Hear ye",
          "message": "henceforth, all assignments must be...",
          "posted_at": "2017-01-31T22:00:00Z",
          "delayed_post_at": null,
          "context_code": "course_2"
        }]
      }'

      # Make the get announcements call
      announcements = client.get_announcements

      # validate
      expect(announcements).to be_kind_of(Array)
      expect(announcements[0]["tilte"]).to eq("Hear ye")
      expect(announcements[0]["message"]).to eq("henceforth, all assignments must be...")
    end
  end
end
