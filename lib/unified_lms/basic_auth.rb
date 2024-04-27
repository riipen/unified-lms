# frozen_string_literal: true

module UnifiedLms

  # Concrete request builder class for canvas API requests
  class BasicAuth < Request

    # Get a connection from Faraday to add a basic auth
    def build_request(connection, **params)
      connection.basic_auth @client_id, @client_secret
      connection.headers['Authorization']

      request_body = { grant_type: 'client_credentials' }
      json_body = JSON.generate(request_body)

      connection.body = json_body
    end
  end
end
