# frozen_string_literal: true

# student.rb holds all the api calls for the blackboard student endpoint. This endpoint deals with all methods related
# to student data

#NOTE: AS OF 02/28/2024 the team still does not have any means to test the following API calls

require_relative "version"
require_relative "error"
require_relative "../../parser/blackboard/student"

module UnifiedLms
  module EndpointBlackboard
    module StudentBlackboard
    include ParserBlackboard
      # Returns a list of user memberships for the specified course or organization.
      # Callers not enrolled in the course must have at least one of the following entitlements:
      # For courses: 'course.user.VIEW', 'system.user.course.enrollment.VIEW', or 'system.courseuserlist.VIEW'
      # For organizations: 'course.user.VIEW', 'system.user.org.enrollment.VIEW', or 'system.orguserlist.VIEW'
      #
      # Callers enrolled in the course will only be able to see memberships that are available and that have
      # opted to be included in the course roster. For callers enrolled in the course as well as those with
      # the 'course.user.VIEW' entitlement, system fields such as externalId and dataSourceId will not be visible
      #
      # @param params [Hash] Query string
      # @return [Array<Hash>] Parsed response JSON
      # @see https://developer.blackboard.com/portal/displayApi/Learn?_gl=1*a4tvl2*_ga*NDEzMzIwNDQ1LjE3MDkxNjg2MDM.*_ga_GSZJ2M400B*MTcwOTE2ODYwMy4xLjAuMTcwOTE2ODYwMy42MC4wLjA.
      def get_students(**params)
        response = get("/learn/api/public/v1/courses/#{params[:course_id]}/users", **params)
        BlackboardResponse.parse_get_students(response)
      end
    end
  end
end
