# frozen_string_literal: true

require "json"

module UnifiedLms
  # Concrete response parser class for blackboard API requests
  class BlackboardResponse < Response
    # Given the specified parameters parses the response comming from blackboard API
    def parse_get_students(response)
      parsedJSON = JSON.parse(response)
      id = parsedJSON['id']
      gender = parsedJSON['user']['gender']
      pronouns = parsedJSON['user']['pronouns']
      name = parsedJSON['name']
    end
  end
end
