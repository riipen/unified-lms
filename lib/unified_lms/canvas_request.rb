# frozen_string_literal: true

module UnifiedLms

  # Concrete request builder class for canvas API requests
  class CanvasRequest < Request
    def initialize(**params)
      @token = params.delete(:token)
    end

    # Get a connection from Faraday to add a bearer token in the header
    def build_request(connection)
      connection.request :authorization, 'Bearer', @token if @token
    end
  end
end
