# frozen_string_literal: true

require "json"
require_relative "../../parser/canvas.assignments"
module UnifiedLms
  module EndpointCanvas
    module AssignmentCanvas
      include ParserCanvas
      # Fetch a paginated list of assignments for the course.
      #
      # @param params [Hash] Query string
      # @return [Array<Hash>] Parsed response JSON
      # @see https://canvas.instructure.com/doc/api/all_resources.html#method.assignments_api.index
      def get_assignments(**params)
        data = get("/api/v1/courses/#{params[:course_id]}/assignments", **params)
        json_data = JSON.parse(data)
        ParserCanvas.get_assignments(json_data)
      end
    end
  end
end