# frozen_string_literal: true

module UnifiedLms
  module ParserBlackboard
    # Fetch a paginated list of students enrolled in this course.
    #
    # @param params [Hash] Query string
    # @return [Array<Hash>] Parsed response JSON
    # @see https://canvas.instructure.com/doc/api/all_resources.html#method.courses.students
    def self.get_students(data)
      parsed_data = JSON.parse(data)
      main_student_data = []

      parsed_data["results"].each do |student|
        main_student_data << {
          id: student["user"]["studentId"],
          Name: student["user"]["name"]["given"],
          last_name: student["user"]["name"]["family"],
          first_name: student["user"]["name"]["given"],
          short_name: student["user"]["name"]["preferredDisplayName"],
          sis_user_id: student["user"]["studentId"],
          email: student["user"]["contact"]["institutionEmail"],
        }.to_json
      end

      # Serialize consolidated data
      return  main_student_data
    end
  end
end
