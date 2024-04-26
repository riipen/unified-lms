# frozen_string_literal: true
require 'json'
require_relative "../../parser/canvas/student"

module UnifiedLms
  module EndpointCanvas
    module StudentCanvas
      # Fetch a paginated list of students enrolled in this course.
      #
      # @param params [Hash] Query string
      # @return [Array<Hash>] Parsed response JSON
      # @see https://canvas.instructure.com/doc/api/all_resources.html#method.courses.students
      def get_students(**params)
        data = get("/api/v1/courses/#{params[:course_id]}/users", :canvas, **params)
        ParserCanvas.get_students(data)
      end
    end
  end
end
