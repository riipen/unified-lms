# frozen_string_literal: true

# content.rb holds all the api calls for the blackboard content endpoint. This endpoint deals with all methods related
# to content data

#NOTE: AS OF 02/28/2024 the team still does not have any means to test the following API calls

require_relative "version"
require_relative "error"
require_relative "../../parser/blackboard/content"

module UnifiedLms
  module EndpointBlackboard
    module ContentBlackboard
      # Lists top level content iteams in a course.
      #
      # @param params [Hash] Query string
      # @return [Array<Hash>] Parsed response JSON
      # @see https://developer.blackboard.com/portal/displayApi
      def get_assignments(**params)
        data = get("/learn/api/public/v1/courses/#{params[:course_id]}/contents", :blackboard, **params)
        ParserBlackboard::get_assignments(data)
      end
    end
  end
end
