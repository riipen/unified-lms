# frozen_string_literal: true

module UnifiedLms
  module EndpointCanvas
    module AssignmentCanvas
      # Fetch a paginated list of assignments for the course.
      #
      # @param params [Hash] Query string
      # @return [Array<Hash>] Parsed response JSON
      # @see https://canvas.instructure.com/doc/api/all_resources.html#method.assignments_api.index
      def get_assignments(**params)
        get("/api/v1/courses/#{params[:course_id]}/assignments", **params)
      end
    end
  end
end