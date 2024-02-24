# frozen_string_literal: true

module UnifiedLms

  # Concrete request builder class for canvas API requests
  class BearerToken < Request

    # Get a connection from Faraday to add a bearer token in the header
    def build_request(connection, **params)
      connection.request :authorization, 'Bearer', params.delete(:token)
    end
  end
end
