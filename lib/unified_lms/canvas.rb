
require_relative "connection"
require_relative "endpoint"

module UnifiedLms
	class Canvas
		include Connection
		include EndpointCanvas

		#def initialize(url, username, password, token: nil)
	end
end