# frozen_string_literal: true
require_relative 'blackboard_endpoint'

module UnifiedLms
  # The controller class for the user.
  # All methods available for the user will be defined here.
  class BlackboardClient < Client
    include EndpointBlackboard

    def initialize(redirect_uri: nil, application_key: nil, client_secret: nil, token: nil)
      # todo get blackboard url
      @url = "https://canvas.instructure.com"
      @grant_type = "client_credentials"
      @application_key = application_key
      @client_secret = client_secret
      @token = token
      @redirect_uri = redirect_uri
      @code = nil
    end

    def authenticate(**params)
      if (@token.nil?)
        get_response = get("/learn/api/public/v1/oauth2/token", :blackboard, **params)
        response_data = JSON.parse(get_response)
        @token = response_data['access_token']
      end
    end

    def build_header
      puts "Blackboard header."
    end
  end
end