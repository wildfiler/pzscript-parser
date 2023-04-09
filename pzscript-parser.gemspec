# frozen_string_literal: true

require_relative "lib/pzscript/parser/version"

Gem::Specification.new do |spec|
  spec.name = "pzscript-parser"
  spec.version = Pzscript::Parser::VERSION
  spec.authors = ["Ivan Arakcheiev"]
  spec.email = ["wildfiler0@gmail.com"]

  spec.summary = "Parser of Project Zomboid media/script files"
  spec.homepage = "https://github.com/wildfiler/pzscript-parser"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/wildfiler/pzscript-parser"
  spec.metadata["changelog_uri"] = "https://github.com/wildfiler/pzscript-parser/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "treetop", "~> 1.6"
end
