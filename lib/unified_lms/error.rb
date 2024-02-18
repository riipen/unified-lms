# frozen_string_literal: true

module UnifiedLms
  # Defines the different types of errors that may
  # be returned by the API
  class Error < StandardError
    def self.from_response(response)
      klass =
        case response.status
        when 400 then BadRequest
        when 401 then Unauthorized
        when 403 then Forbidden
        when 404 then NotFound
        when 400..499 then ClientError
        when 500 then InternalServerError
        when 502 then BadGateway
        when 503 then ServiceUnavailable
        when 500..599 then ServerError
        end
      klass&.new(response)
    end

    def initialize(response = nil)
      @response = response
      super(build_error_message)
    end

    private

    def build_error_message
      return nil if @response.nil?

      "#{@response.env.method.upcase} #{@response.env.url}: " \
        "#{@response.status} - #{@response.body}"
    end
  end

  # An error returned by the server that falls within the 400-499 range (caused by client)
  class ClientError < Error; end

  # The request made by the client does not resolve
  class BadRequest < Error; end

  # The client is not authorized to make this request
  class Unauthorized < Error; end

  # Client does not have the permissions to make this request
  class Forbidden < Error; end

  # The request made by the client cannot be found
  class NotFound < Error; end

  # An error on the serverside that falls within th 500-599 range (caused by server not client)
  class ServerError < Error; end

  # The server has encountered an unforseen condition that prevents it from fulfilling the clients request
  class InternalServerError < Error; end

  # The server, while acting as a gateway or proxy,
  # received an invalid response from an inbound server
  # it accessed while attempting to fulfill the request
  class BadGateway < Error; end

  #  The server is not ready to handle the request
  class ServiceUnavailable < Error; end
end
