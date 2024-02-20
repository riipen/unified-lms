
module UnifiedLms
	module EndpointCanvas
		require_relative "endpoint/canvas/student"

		include StudentCanvas
	end

	module EndpointBlackboard
		require_relative "endpoint/blackboard/student"

		include StudentBlackboard
	end
end