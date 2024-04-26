# frozen_string_literal: true
require_relative "../../parser/canvas/submission"

module UnifiedLms
  module EndpointCanvas
    module SubmissionCanvas
      include ParserCanvas
      # Get a single submission, based on course id, assignment id and user id.
      #
      # @param params [Hash] Query string
      # @return [Array<Hash>] Parsed response JSON
      # @see https://canvas.instructure.com/doc/api/all_resources.html#method.submissions_api.show
      def get_submission(**params)
        get("/api/v1/courses/#{params[:course_id]}/assignments/#{params[:assignment_id]}/submissions/#{params[:user_id]}", :canvas, **params)
        ParserCanvas::get_submission(data)
      end
    end
  end
end
