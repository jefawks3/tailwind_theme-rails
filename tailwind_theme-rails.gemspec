# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require "tailwind_theme/rails/version"

Gem::Specification.new do |spec|
  spec.name        = "tailwind_merge-rails"
  spec.version     = TailwindTheme::Rails::VERSION
  spec.authors     = ["James Fawks"]
  spec.email       = ["hello@jfawks.com"]
  spec.homepage    = "https://github.com/jefawks3/tailwind_theme-rails"
  spec.summary     = "Rails helpers for TailwindTheme"
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jefawks3/tailwind_theme-rails"
  spec.metadata["changelog_uri"] = "https://github.com/jefawks3/tailwind_theme-rails/releases"

  spec.files = Dir["{app,config,lib}/**/*", "MIT-LICENSE", "README.md"]
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.7.0"

  spec.add_dependency "tailwind_theme", "~> 0.1"
  spec.add_runtime_dependency "railties", ">= 6.0.0"
  spec.add_runtime_dependency "activesupport", [">= 6.0.0", "< 8.0"]
end
