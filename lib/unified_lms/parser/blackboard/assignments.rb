# frozen_string_literal: true

module UnifiedLms
  module ParserBlackboard
    # Fetch a list of assignments (called contents in blackboard).
    #
    # @param params [Hash] Query string
    # @return [Array<Hash>] Parsed response JSON
    # @see https://developer.blackboard.com/portal/displayApi
    def self.get_assignments(data)
      data = JSON.parse(response)
      main_student_data = []

      data["results"].each do |assignment|
        main_student_data << {
          id: assignment["id"],
          title: assignment["title"],
          description: assignment["description"],
          start_time: assignment["availability"]["start"],
          end_time: assignment["availability"],
        }.to_json
      end

      # Serialize consolidated data
      return main_student_data
    end
  end
end
