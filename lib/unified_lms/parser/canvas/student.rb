# frozen_string_literal: true

module UnifiedLms
  module ParserCanvas
    # Fetch a paginated list of students enrolled in this course.
    #
    # @param params [Hash] Query string
    # @return [Array<Hash>] Parsed response JSON
    # @see https://canvas.instructure.com/doc/api/all_resources.html#method.courses.students
    def self.get_students(data)
      # TODO: parse get students information
      puts "get students"
    end
  end
end