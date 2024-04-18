# frozen_string_literal: true
require 'json'

module UnifiedLms
  module ParserCanvas
    # Fetch a paginated list ofsubmissions for an assignment.
    #
    # @param params [Hash] Query string
    # @return [Array<Hash>] Parsed response JSON
    # @see https://canvas.instructure.com/doc/api/submissions.html#method.submissions_api.index
    def self.get_submissions(data)
      main_submission_data = []

      JSON.parse(data).each do |submission|
        main_submission_data << {
          assignment_id: submission[:assignment_id],
          user_id: submission[:user_id],
          grader_id: submission[:grader_id],
          canvadoc_document_id: submission[:canvadoc_document_id],
          score: submission[:score],
          body: submission[:body],
          grade: submission[:grade]
        }
      end

      # Serialize consolidated data
      render json: main_student_data
    end
  end
end