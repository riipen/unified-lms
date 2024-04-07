require 'spec_helper'

RSpec.describe BlackboardClient do
  describe '#get_courses' do
    it 'returns course list from Canvas LMS' do

      #Setup Test
      blackboard_client = BlackboardClient.new
      currentUser = "user1"

      mock_response = [
        'course_id' => 123
      ]

      allow(blackboard_client.to receive(:get_courses).with(currentUser).and_return(mock_response))

      courses = blackboard_client.get_courses(currentUser)

      expect(courses).to be_an(Array)
    end
  end
end