# frozen_string_literal: true

module UnifiedLms
  module ParserBlackboard
    # Fetch a paginated list of courses enrolled in this course.
    #
    # @param params [Hash] Query string
    # @return [Array<Hash>] Parsed response JSON
    # @see https://canvas.instructure.com/doc/api/all_resources.html#method.courses.courses
    def self.get_courses(data)
      data = JSON.parse(response)
      main_course_data = []

      data["results"].each do |course|
        main_course_data << {
          id: course["courseid"],
        }
      end

      # Serialize consolidated data
      render json: main_course_data
    end
  end
end