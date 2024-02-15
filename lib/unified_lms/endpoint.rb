
module UnifiedLms
	module EndpointCanvas
		require_relative "endpoint/canvas/session"
		require_relative "endpoint/canvas/student"
		# require_relative "endpoint/canvas/quiz"
		# etc etc

		include SessionCanvas
		include StudentCanvas
		# include QuizCanvas
		# etc etc
	end

	module EndpointBlackboard
		require_relative "endpoint/blackboard/session"
		require_relative "endpoint/blackboard/student"
		# require_relative "endpoint/blackboard/quiz"
		# etc etc

		include SessionBlackboard
		include StudentBlackboard
		# include QuizBlackboard
		# etc etc
	end
end