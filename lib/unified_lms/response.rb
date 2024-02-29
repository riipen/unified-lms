# frozen_string_literal: true

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
        JSONParser.new
      when :blackboard
        puts "Blackboard Request"
      else
        raise ArgumentError, "Invalid request type"
      end
    end

    # To be implemented in all aggregate classes of response to build the correct response
    def build_response
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
