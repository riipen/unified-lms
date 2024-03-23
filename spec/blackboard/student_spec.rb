# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BlackboardClient do
  describe '#get_student_details' do
    it 'returns details for a specific student' do
      # Setup
      blackboard_client = BlackboardClient.new
      student_id = '123'
      mock_response = { 'id' => student_id, 'name' => 'John Doe', 'email' => 'johndoe@example.com' }
      allow(blackboard_client).to receive(:get_student_details).with(student_id).and_return(mock_response)
      
      
      student_details = blackboard_client.get_student_details(student_id)
      
      # Verify
      expect(student_details).to be_a(Hash)
      expect(student_details['id']).to eq(student_id)
      expect(student_details['name']).to eq('John Doe')
    
    end
  end
  # More tests if needed
end
