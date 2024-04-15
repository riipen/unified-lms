# frozen_string_literal: true

# attempt.rb holds all the api calls for the blackboard attempt endpoint. This endpoint deals with all methods related
# to attempt data

#NOTE: AS OF 02/28/2024 the team still does not have any means to test the following API calls

require_relative "version"
require_relative "error"

module UnifiedLms
  module EndpointBlackboard
    module AttemptBlackboard
      # Get the attempt receipt associated with the @param attemptReceiptIdParam
      #
      # Users with all the following entitlements may access this resource:
      #
      # GradebookEntitlement.ViewAttempts
      #
      # @param params [Hash] Query string
      # @return [Array<Hash>] Parsed response JSON
      # @see https://developer.blackboard.com/portal/displayApi
      def get_submission(**params)
        get("/learn/api/public/v1/attemptReceipts/#{params[:attemptReceiptId]}", **params)
      end
    end
  end
end