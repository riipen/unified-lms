# frozen_string_literal: true
require 'json'

module UnifiedLms
  module ParserCanvas
    # Fetch a paginated list of students enrolled in this course.
    #
    # @param params [Hash] Query string
    # @return [Array<Hash>] Parsed response JSON
    # @see https://canvas.instructure.com/doc/api/all_resources.html#method.courses.students
    def self.get_students(data)
      main_student_data = []
      parsed_data = JSON.parse(data)

      parsed_data.each do |student|
        main_student_data << {
          "id": student['id'],
          "name": student['name'],
          "last_name": student['last_name'],
          "first_name": student['first_name'],
          "short_name": student['short_name'],
          "sis_user_id": student['sis_user_id'],
          "email": student['email']
        }.to_json
      end

      # Serialize consolidated data
      return main_student_data
    end
  end
end
