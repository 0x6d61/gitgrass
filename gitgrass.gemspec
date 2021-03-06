# frozen_string_literal: true

require_relative "lib/gitgrass/version"

Gem::Specification.new do |spec|
  spec.name = "gitgrass"
  spec.version = Gitgrass::VERSION
  spec.authors = ["0x6d61"]
  spec.email = ["0x6d61@gmail.com"]

  spec.summary = "Show commit on github"
  spec.description = "githubの草をcliで表示するコマンド"
  spec.homepage = "https://github.com/0x6d61"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = "https://github.com/0x6d61"
  spec.metadata["source_code_uri"] = "https://github.com/0x6d61/gitgrass"
  spec.metadata["changelog_uri"] = "https://github.com/0x6d61/gitgrass/commits/master"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "thor", "~> 1.0", ">= 1.0.1"
  spec.add_dependency "rainbow", "~> 3.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
