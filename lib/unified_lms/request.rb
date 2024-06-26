# frozen_string_literal: true

module UnifiedLms
  # The Abstract factory builder class for making requests to different LMS's
  # This class will send the request after it is built by the proper concrete LMS request class
  class Request
    # Factory to create headers for a request
    def self.create_request(type)
      case type
      when :canvas
        require_relative 'bearer_token'
        BearerToken.new
      when :blackboard
        if @token.nil?
          require_relative 'basic_auth'
          BasicAuth.new
        else
          require_relative 'bearer_token'
          BearerToken.new
        end
      else
        raise ArgumentError, "Invalid request type"
      end
    end

    # To be implemented in all aggregate classes of request to build the correct request URI
    # based on the LMS specified
    def build_request
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
