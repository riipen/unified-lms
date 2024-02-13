# frozen_string_literal: true

require_relative "unified_lms/version"

module UnifiedLms
  class Error < StandardError; end
  # Your code goes here...

  class TimeoutError < StandardError; end
  # Code here...

  class CallNotFoundError < StandardError; end
  # Code here...

  class LMSNotDefinedError < StandardError; end
  # Code here...

  class MethodNotDefinedError < StandardError; end
  # Code here...


end
