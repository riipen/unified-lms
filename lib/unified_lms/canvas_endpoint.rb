require_relative "endpoint/canvas/announcement"
require_relative "endpoint/canvas/assignment"
require_relative "endpoint/canvas/course"
require_relative "endpoint/canvas/student"
require_relative "endpoint/canvas/submission"
require_relative "parser/canvas/assignments"

module UnifiedLms
  module EndpointCanvas
    include AnnouncementCanvas
    include AssignmentCanvas
    include CourseCanvas
    include StudentCanvas
    include SubmissionCanvas

    include ParserCanvas
  end
end
