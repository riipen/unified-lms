# frozen_string_literal: true

require_relative "lib/unified_lms/version"

Gem::Specification.new do |spec|
  spec.name = "unified_lms"
  spec.version = UnifiedLms::VERSION
  spec.authors = ["mrgutie8", "apassett", "grustia01", "lmortiz6", "Danirodriguezg00"]
  spec.email = ["mrgutie8@asu.edu", "apassett@asu.edu", "grustia01@asu.edu", "lmortiz6@asu.edu", "Danirodriguezg00@asu.edu"]

  spec.summary = "Ruby client library to unify different learning management systems."
  spec.description = "Ruby client library to unify different learning management systems."
  spec.homepage = "https://github.com/riipen/unified-lms/tree/dev"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  #
  spec.add_runtime_dependency 'faraday', '>= 1.2.0'
  spec.add_runtime_dependency 'faraday_middleware'
  spec.add_dependency "rspec"
  spec.add_dependency "webmock"
end