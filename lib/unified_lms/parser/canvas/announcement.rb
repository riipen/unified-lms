# frozen_string_literal: true
require 'json'

module UnifiedLms
  module ParserCanvas
    # Fetch a paginated list of announcements for the given courses and date range.
    #
    # @param params [Hash] Query string
    # @return [Array<Hash>] Parsed response JSON
    # @see https://canvas.instructure.com/doc/api/all_resources.html#method.announcements_api.index
    def self.get_announcements(data)
      main_announcements_data = []

      JSON.parse(data).each do |announcement|
        main_announcements_data << {
          id: announcement[:id],
          title: announcement[:title],
          message: announcement[:message],
          posted_at: announcement[:posted_at]
        }.to_json
      end

      # Serialize consolidated data
      return main_announcements_data
    end
  end
end