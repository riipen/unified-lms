# frozen_string_literal: true
require 'cgi'

require_relative "version"
require_relative "client"

module UnifiedLms

  # The controller class for the user.
  # All methods available for the user will be defined here.
  class CanvasClient < Client

    # @param [nil] client_id
    def initialize(url: nil, client_id: nil, client_secret: nil, token: nil, redirect_uri: nil)
      @url = url
      @grant_type = "authorization_code"
      @client_id = client_id
      @client_secret = client_secret
      @token = token
      @redirect_uri = redirect_uri
      @code = nil
      puts @token
    end

    # Authenticate with canvas is order to get the final token for request
    def authenticate(**params)
      if (@token.nil?)
        # get code from canvas
        params = {client_id: @client_id, response_type: "code", redirect_uri: @redirect_uri}.merge(params)
        get_response = get("login/oauth2/auth", :canvas, **params)

        # get code value from response
        uri = URI.parse(get_response)
        query_params = CGI.parse(uri.query)
        @code = query_params['code']&.first
        #
        # # get final access token
        params = {grant_type: @grant_type, client_secret: @client_secret, code: @code}.merge(params)
        @token = post("/login/oauth2/token", :canvas, **params)
      end
    end
  end
end