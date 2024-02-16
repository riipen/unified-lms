# frozen_string_literal: true

require_relative "unified_lms/version"
require_relative "unified_lms/error"

module UnifiedLms
  # The Abstract factory builder class for making requests to different LMS's
  # This class will send the request after it is built by the proper concrete LMS request class
  class Request
    # To be implemented in all aggregate classes of request to build the correct request URI
    # based on the LMS specified
    def build_request
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    # Sends a request to the API Server
    def send_request
      # Using the the URI returned by the build_request method in the concrete LMS request class
      # send a request to the API server
    end
  end
end
