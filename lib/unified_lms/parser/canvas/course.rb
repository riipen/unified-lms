# frozen_string_literal: true
require 'json'

module UnifiedLms
  module ParserCanvas
    # Fetch a paginated list of students enrolled in this course.
    #
    # @param params [Hash] Query string
    # @return [Array<Hash>] Parsed response JSON
    # @see https://canvas.instructure.com/doc/api/all_resources.html#method.courses.students
    def self.get_courses(data)
      main_course_data = []

      JSON.parse(data).each do |cpurse|
        main_student_data << {
          id: 1,
          name: "Default Term",
          start_at: "2012-06-01T00:00:00-06:00",
          end_at: null
        }
      end

      # Serialize consolidated data
      render json: main_student_data
    end
  end
end