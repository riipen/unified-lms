# frozen_string_literal: true
require 'cgi'

require_relative "version"
require_relative "client"
require_relative "canvas_endpoint"

module UnifiedLms
  # The controller class for the user.
  # All methods available for the user will be defined here.
  class CanvasClient < Client
    include EndpointCanvas

    def initialize(redirect_uri: nil, client_id: nil, client_secret: nil, token: nil)
      @url = "https://canvas.instructure.com"
      @grant_type = "authorization_code"
      @client_id = client_id
      @client_secret = client_secret
      @token = token
      @redirect_uri = redirect_uri
      @code = nil
    end

    # Authenticate with canvas is order to get the final token for request
    def authenticate(**params)
      if @token.nil?
        # get code from canvas
        params = {client_id: @client_id, response_type: "code", redirect_uri: @redirect_uri}.merge(params)
        get_response = get("/login/oauth2/auth", :canvas, **params)

        # get code value from response
        uri = URI.parse(get_response)
        query_params = CGI.parse(uri.query)
        @code = query_params['code']&.first
        #
        # # get final access token
        params = {grant_type: @grant_type, client_secret: @client_secret, code: @code}.merge(params)
        token_response = post("/login/oauth2/token", :canvas, **params)
        @token = JSON.parse(token_response)['access_token']
      end
    end
  end
end