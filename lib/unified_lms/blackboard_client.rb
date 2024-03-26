# frozen_string_literal: true

require_relative "version"
require_relative "client"
require_relative "blackboard_endpoints"

module UnifiedLms
  # The controller class for the user.
  # All methods available for the user will be defined here.
  class BlackboardClient < Client
  include EndpointBlackboard

    def authenticate
      puts "BlackboardClient authenticated"
    end

    def build_header
      puts "Blackboard header."
    end
  end
end
