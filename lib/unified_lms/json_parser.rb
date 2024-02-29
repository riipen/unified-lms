# frozen_string_literal: true

require 'json'

module UnifiedLms
  # Concrete response parser class for canvas API requests
  class JSONParser < Response

    def build_response(response, **params)
      begin
        # Parse the JSON string
        data = JSON.parse(response)

        #iterates over array json response
        data.each do |item|
          puts item
        end

        return data

      rescue JSON::ParserError => e
        puts "Error parsing JSON: #{e.message}"
        return nil
      end
    end
  end
end
