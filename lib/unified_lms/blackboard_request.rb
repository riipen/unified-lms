# frozen_string_literal: true

module UnifiedLms
  # Concret
  #
  # e request builder class for blackboard API requests
  # TODO: rename for type of header blackboard needs
  class BlackboardRequest < Request
    # Given the specified parameters builds the URI for making a request to blackboard API
    def build_request
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end