# frozen_string_literal: true

require "json"

module UnifiedLms
  # Concrete response parser class for blackboard API requests
  class BlackboardResponse < Response
    # Given the specified parameters parses the response comming from blackboard API
    def parse(response, path)
      parsed = JSON.parse(response)
    end
  end
end
