# frozen_string_literal: true

module UnifiedLms
  # Concrete request builder class for canvas API requests
  class CanvasRequest < Request
    def initialize(token)
      @token = token
    end
    # Given the specified parameters builds the URI for making a request to canvas API
    def build_request(connection)
      # connection.request :authorization, 'Bearer', @token if @token
      puts connection
      puts @token
    end
  end
end
