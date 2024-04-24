require 'json'

module UnifiedLms
  module ParserBlackboard
    # Parse the response from the Blackboard API.
    #
    # @param response [String] JSON response string
    # @return [String] Serialized JSON response data
    def self.parse_response(response)
        data = JSON.parse(response)
        parsed_data = []

        data["results"].each do |course|
          parsed_course = {}
          parsed_course[:courseId] = course["courseId"]
          parsed_course[:name] = course["name"]
          parsed_course[:description] = course["description"]
          parsed_course[:externalId] = course["externalId"]
          parsed_course[:created] = course["created"]
          parsed_course[:allowGuests] = course["allowGuests"]
          parsed_course[:availability] = course["availability"]
          parsed_course[:dataSourceId] = course["dataSourceId"]
          parsed_course[:termId] = course["termId"]
          parsed_course[:organization] = course["organization"]
          parsed_data << parsed_course
        end

      render json: parsed_data
    rescue JSON::ParserError => e
      # Handle JSON parsing errors
      puts "Error parsing JSON response: #{e.message}"
      JSON.generate([])
      end
  end
end