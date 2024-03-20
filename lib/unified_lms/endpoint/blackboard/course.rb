# frozen_string_literal: true

# course.rb holds all the api calls for the blackboard course endpoint. This endpoint deals with all methods related
# to course data

#NOTE: AS OF 02/28/2024 the team still does not have any means to test the following API calls

require_relative "version"
require_relative "error"

module UnifiedLms
  module EndpointBlackboard
    module CourseBlackboard
      # Returns a list of courses and organizations.
      #
      # To view disabled courses a user must have the entitlement 'system.course.VIEW'.
      #
      # Users with the 'course.configure-properties.EXECUTE' course entitlement, or the 'system.course.properties.MODIFY' system entitlement can access all course properties.
      #
      # Users enrolled in the course have read access to all properties except:
      #
      # uuid
      # externalId
      # dataSourceId
      # created
      # allowGuests
      # enrollment.accessCode
      # Users who are not enrolled in the course and do not have associated entitlements only have read access to the following properties:
      #
      # id
      # courseId
      # name
      # description
      # organization
      # readOnly
      # termId
      # availability.available
      # availability.duration.type
      # availability.duration.start
      # availability.duration.end
      # availability.duration.daysOfUse
      # When courses are child courses, parent course data is also returned to provide a complete data representation of course relationships.
      # If the course enrollment is self-enroll, all users can view the course as though they were enrolled.
      #
      # @param params [Hash] Query string
      # @return [Array<Hash>] Parsed response JSON
      # @see https://developer.blackboard.com/portal/displayApi
        get("/learn/api/public/v3/courses", **params)
      end
    end
  end
end
