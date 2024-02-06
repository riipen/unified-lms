# frozen_string_literal: true

require_relative "unified_lms/version"

module UnifiedLms
  # Concrete request builder class for canvas API requests
  class CanvasRequest < Request
    # Given the specified parameters builds the URI for making a request to canvas API
    def build_request
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
