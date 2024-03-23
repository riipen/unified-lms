# frozen_string_literal: true

module UnifiedLms
  module EndpointCanvas
    module StudentCanvas
      # Fetch a paginated list of students enrolled in this course.
      #
      # @param params [Hash] Query string
      # @return [Array<Hash>] Parsed response JSON
      # @see https://canvas.instructure.com/doc/api/all_resources.html#method.courses.students
      def get_students(**params)
        params = { enrollment_type: "student" }.merge(params)
        get("/api/v1/courses/#{params[:course_id]}/users", **params)
      end
    end
  end
end