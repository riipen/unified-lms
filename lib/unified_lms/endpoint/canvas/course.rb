# frozen_string_literal: true

module UnifiedLms
  module EndpointCanvas
    module CourseCanvas
      # Fetch a paginated list of active courses for the current user.
      #
      # @param params [Hash] Query string
      # @return [Array<Hash>] Parsed response JSON
      # @see https://canvas.instructure.com/doc/api/all_resources.html#method.courses.index
      def get_courses(**params)
        get("/api/v1/courses", **params)
      end
    end
  end
end