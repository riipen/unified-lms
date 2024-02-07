# frozen_string_literal: true

require_relative "version"
require_relative "client"

module UnifiedLms

  # The controller class for the user.
  # All methods available for the user will be defined here.
  class CanvasClient < Client
    def authenticate
      puts "CanvasClient authenticated"
    end

    def build_header
      puts "Canvas header."
    end
  end
end