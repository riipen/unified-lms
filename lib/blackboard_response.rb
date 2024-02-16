# frozen_string_literal: true

require_relative "unified_lms/version"
require_relative "unified_lms/error"

module UnifiedLms
  # Concrete response parser class for blackboard API requests
  class BlackboardResponse < Response
    # Given the specified parameters parses the response comming from blackboard API
    def parse_response
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
