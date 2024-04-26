require_relative "endpoint/blackboard/announcements"
require_relative "endpoint/blackboard/attempt"
require_relative "endpoint/blackboard/content"
require_relative "endpoint/blackboard/course"
require_relative "endpoint/blackboard/student"

module UnifiedLms
  module EndpointBlackboard
    include AnnouncementBlackboard
    include AttemptBlackboard
    include ContentBlackboard
    include CourseBlackboard
    include StudentBlackboard
  end
end