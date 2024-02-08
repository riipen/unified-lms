Gem::Specification.new do |spec|
  spec.name          = "simple_gem"
  spec.version       = "0.1.0"

  spec.summary       = "A simple gem demonstrating HTTP requests and testing."

  spec.files         = Dir["lib/**/*.rb", "bin/*", "LICENSE.txt", "README.md"]
  spec.bindir        = "bin"

  # All dependencies treated as runtime dependencies
  spec.add_dependency "faraday"
  spec.add_dependency "rspec"

end