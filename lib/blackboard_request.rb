# frozen_string_literal: true

require_relative "unified_lms/version"
require_relative "unified_lms/error"

module UnifiedLms
  # Concrete request builder class for blackboard API requests
  class BlackboardRequest < Request
    # Given the specified parameters builds the URI for making a request to blackboard API
    def build_request
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
