# frozen_string_literal: true

# course.rb holds all the api calls for the blackboard course endpoint. This endpoint deals with all methods related
# to course data

#NOTE: AS OF 02/28/2024 the team still does not have any means to test the following API calls

require_relative "version"
require_relative "error"
require_relative "../../parser/blackboard/course"

module UnifiedLms
  module EndpointBlackboard
    module CourseBlackboard
      include ParserBlackboard
      # Returns a list of courses and organizations.
      #
      # @param params [Hash] Query string
      # @return [Array<Hash>] Parsed response JSON
      # @see https://developer.blackboard.com/portal/displayApi
      def get_courses(**params)
        get("/learn/api/public/v3/courses", :blackboard, **params)
        ParserBlackboard::get_courses(data)
      end
    end
  end
end
