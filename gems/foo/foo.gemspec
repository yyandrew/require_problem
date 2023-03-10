# frozen_string_literal: true

require_relative "lib/foo/version"

Gem::Specification.new do |spec|
  spec.name = "foo"
  spec.version = Foo::VERSION
  spec.authors = ["yyandrew"]
  spec.email = ["qqerqqer@126.com"]

  spec.summary = "foo"
  spec.description = "foo"
  spec.homepage = "https://foo.foo"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.5.0"

  spec.metadata["allowed_push_host"] = "https://foo.foo"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://foo.foo"
  spec.metadata["changelog_uri"] = "https://foo.foo"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
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
