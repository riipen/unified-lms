# frozen_string_literal: true

describe CanvasClient do
  describe "get_announcements" do
    it "Retrieves the announcements for a course" do
      client = CanvasClient.new
      parser = ParserCanvas.new

      responseJSON = client.get_announcements

      parsed = parser(responseJSON)

      expect(parsed).to be_kind_of(Array)
    end
  end
end
