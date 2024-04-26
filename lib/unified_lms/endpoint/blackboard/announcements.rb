# frozen_string_literal: true

# student.rb holds all the api calls for the blackboard student endpoint. This endpoint deals with all methods related
# to student data

#NOTE: AS OF 02/28/2024 the team still does not have any means to test the following API calls

require_relative "version"
require_relative "error"
require_relative "../../parser/blackboard/announcements"

module UnifiedLms
  module EndpointBlackboard
    module AnnouncementBlackboard
      # Returns a list of course announcements for the specified course or organization.
      # @param params [Hash] Query string
      # @return [Array<Hash>] Parsed response JSON
      # @see https://developer.blackboard.com/portal/displayApi
      def get_announcements(**params)
        data = get("/learn/api/public/v1/courses/#{params[:course_id]}/announcements", :blackboard, **params)
        ParserBlackboard::get_announcements(data)
      end
    end
  end
end
