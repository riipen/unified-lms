# frozen_string_literal: true

require_relative "unified_lms/version"
require_relative "unified_lms/error"

module UnifiedLms
  # The Abstract factory builder class for parsing responses from different LMS's
  # The concrete response builder will parse the reponse from a specified LMS and return
  # the string representation of the response
  class Response
    # To be implemented in all aggregate classes of Response to parse the responce expected by an LMS
    def self.parse_response(type)
      case type
      when :canvas
        require_relative 'json_parser'
        BearerToken.new
      when :blackboard
        require_relative 'blackboard_response'
      else
        raise ArgumentError, "Invalid request type"
      end
    end
  end
end
