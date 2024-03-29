# frozen_string_literal: true

require_relative "lib/proxied_request/version"

Gem::Specification.new do |spec|
  spec.name = "proxied_request"
  spec.version = ProxiedRequest::VERSION
  spec.authors = ["plusleft"]
  spec.email = ["107749872+0xleft@users.noreply.github.com"]

  spec.summary = "Make HTTP requests through a tor as proxy."
  spec.
  spec.homepage = "https://github.com/0xleft/proxiedrequest"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/0xleft/proxiedrequest"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
