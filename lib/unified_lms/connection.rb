# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require_relative 'request'

module UnifiedLms
  module Connection
    def get(path, **params)
      request(:get, path, params)
    end

    def post(path, **params)
      request(:post, path, params)
    end

    def put(path, **params)
      request(:put, path, params)
    end

    def delete(path, **params)
      request(:delete, path, params)
    end

    def head(path, **params)
      request(:head, path, params)
    end

    private

    def request(method, path, params)
      headers = params.delete(:headers)
      Request.create_request(:canvas, token: @token).build_request("connection")

      # response = connection.public_send(method, path, params) do |request|
      #   headers&.each_pair { |k, v| request.headers[k] = v }
      # end
      #
      # # error = Error.from_response(response)
      # # raise error if error
      #
      # response.body
    end

    # TODO: make this generic since this includes the bearer just for Canvas
    def connection
      @connection ||= Faraday.new(url: @url) do |c|
        c.request :json, content_type: /\bjson$/
        c.response :json, content_type: /\bjson$/
        c.request :url_encoded, content_type: /x-www-form-urlencoded/
        c.adapter Faraday.default_adapter
        c.headers['User-Agent'] =
          "Unified_LMS/#{VERSION} (#{RUBY_ENGINE}#{RUBY_VERSION})"

        Request.create_request(:canvas).build_request(connection)

        # c.request :authorization, 'Bearer', @token if @token
      end
    end
  end
end
