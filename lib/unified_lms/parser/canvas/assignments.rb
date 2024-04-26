# frozen_string_literal: true
require 'json'

module UnifiedLms
  module ParserCanvas
    # Fetch a paginated list of students enrolled in this course.
    #
    # @param params [Hash] Query string
    # @return [Array<Hash>] Parsed response JSON
    # @see https://canvas.instructure.com/doc/api/all_resources.html#method.courses.students
    def self.get_assignments(data)
      main_student_data = []

      JSON.parse(data).each do |assignment|
        main_student_data << {
          id: assignment[:id],
          description: assignment[:description],
          course_id: assignment[:course_id],
        }.to_json
      end

      # Serialize consolidated data
      return main_student_data
    end
  end
end
