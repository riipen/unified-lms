# frozen_string_literal: true
require 'json'
require_relative "../../parser/canvas/student"

module UnifiedLms
  module EndpointCanvas
    module StudentCanvas
      include ParserCanvas
      # Fetch a paginated list of students enrolled in this course.
      #
      # @param params [Hash] Query string
      # @return [Array<Hash>] Parsed response JSON
      # @see https://canvas.instructure.com/doc/api/all_resources.html#method.courses.students
      def get_students(**params)
        params = { enrollment_type: "student" }.merge(params)
        data = get("/api/v1/courses/#{params[:course_id]}/students", **params)
        json_data = JSON.parse(data)
        ParserCanvas.get_students(json_data)
      end
    end
  end
end