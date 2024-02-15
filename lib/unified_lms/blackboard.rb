
require_relative "connection"
require_relative "endpoint"

module UnifiedLms
	class Blackboard
		include Connection
		include EndpointBlackboard

		#def initialize(url, username, password, token: nil)
	end
end