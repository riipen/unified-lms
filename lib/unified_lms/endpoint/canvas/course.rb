# frozen_string_literal: true
require_relative "../../parser/canvas/course"

module UnifiedLms
  module EndpointCanvas
    module CourseCanvas
      include ParserCanvas
      # Fetch a paginated list of active courses for the current user.
      #
      # @param params [Hash] Query string
      # @return [Array<Hash>] Parsed response JSON
      # @see https://canvas.instructure.com/doc/api/all_resources.html#method.courses.index
      def get_courses(**params)
        data = get("/api/v1/courses", **params)
        ParserCanvas::get_courses(data)
      end
    end
  end
end