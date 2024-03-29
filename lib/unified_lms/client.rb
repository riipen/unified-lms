# frozen_string_literal: true

require_relative "connection"

module UnifiedLms
  # The controller class for the user.
  # All methods available for the user will be defined here.
  class Client
    include Connection

    # Auth abstract for client factory
    def authenticate
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    # Create a new Client Factory
    def self.create_client(type, **params)
      case type
      when :canvas
        require_relative "canvas_client"
        CanvasClient.new(**params)
      when :blackboard
        require_relative "blackboard_client"
        BlackboardClient.new
      else
        raise ArgumentError, "Invalid client type: #{type}"
      end
    end
  end
end
