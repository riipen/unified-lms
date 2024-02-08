# frozen_string_literal: true

require_relative "unified_lms/version"

module UnifiedLms
  # Concrete response parser class for canvas API requests
  class CanvasResponse < Response
    # Given the specified parameters parses the response comming from canvas API
    def parse_response
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
