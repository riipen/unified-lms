# frozen_string_literal: true

module UnifiedLms
  module EndpointCanvas
    module AnnouncementCanvas
      # Fetch a paginated list of announcements for the given courses and date range.
      #
      # @param params [Hash] Query string
      # @return [Array<Hash>] Parsed response JSON
      # @see https://canvas.instructure.com/doc/api/all_resources.html#method.announcements_api.index
      def get_announcements(**params)
        get("/api/v1/announcements", **params)
      end
    end
  end
end