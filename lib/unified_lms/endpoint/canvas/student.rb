# frozen_string_literal: true

module Metabase
  module EndpointCanvas
    module StudentCanvas
      # Fetch a paginated list of students enrolled in this course.
      #
      # @param params [Hash] Query string
      # @return [Array<Hash>] Parsed response JSON
      # @see https://canvas.instructure.com/doc/api/all_resources.html#method.courses.students
      def get_students(**params)
        get("/api/v1/courses/#{params[:course_id]}/students", **params)
      end
    end
  end
end