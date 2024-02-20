# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require_relative 'request'

module UnifiedLms
  module Connection
    def get(path, type, **params)
      request(:get, path, type, **params)
    end

    def post(path, type, **params)
      request(:post, path, type, **params)
    end

    def put(path, type, **params)
      request(:put, path, type, **params)
    end

    def delete(path, type, **params)
      request(:delete, path, type, **params)
    end

    def head(path, type, **params)
      request(:head, path, type, **params)
    end

    private

    def request(method, path, type, **params)
      headers = params.delete(:headers)

      # response = connection.public_send(method, path, params) do |request|
      #   headers&.each_pair { |k, v| request.headers[k] = v }
      # end
      #
      # error = Error.from_response(response)
      # raise error if error
      #
      # response.body
    end

    def connection
      @connection ||= Faraday.new(url: @url) do |c|
        c.request :json, content_type: /\bjson$/
        c.response :json, content_type: /\bjson$/
        c.request :url_encoded, content_type: /x-www-form-urlencoded/
        c.adapter Faraday.default_adapter
        c.headers['User-Agent'] =
          "Unified_LMS/#{VERSION} (#{RUBY_ENGINE}#{RUBY_VERSION})"

        Request.create_request(type, **params).build_request(c)
      end
    end
  end
end
