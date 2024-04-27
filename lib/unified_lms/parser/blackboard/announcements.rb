# frozen_string_literal: true

module UnifiedLms
  module ParserBlackboard
    # Fetch a list of announcement
    #
    # @param params [Hash] Query string
    # @return [Array<Hash>] Parsed response JSON
    # @see https://developer.blackboard.com/portal/displayApi
    def self.get_announcements(data)
      parsed_data = JSON.parse(data)
      main_student_data = []

      parsed_data["results"].each do |assignment|
        main_student_data << {
          id: assignment["id"],
          title: assignment["title"],
          body: assignment["body"],
          draft: assignment["draft"],
        }.to_json
      end

      # Serialize consolidated data
      return main_student_data
    end
  end
end
