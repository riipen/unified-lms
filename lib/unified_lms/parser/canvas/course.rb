# frozen_string_literal: true
require 'json'

module UnifiedLms
  module ParserCanvas
    # Fetch a paginated list of students enrolled in this course.
    #
    # @param params [Hash] Query string
    # @return [Array<Hash>] Parsed response JSON
    # @see https://canvas.instructure.com/doc/api/courses.html
    def self.get_courses(data)
      main_course_data = []
      parsed_data = JSON.parse(data)

      parsed_data.each do |course|
        main_student_data << {
          id: course['id'],
          name: course['name'],
          start_at: course['start_at'],
          end_at: course['end_at']
        }.to_json
      end

      # Serialize consolidated data
      return main_student_data
    end
  end
end