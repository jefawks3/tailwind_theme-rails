# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require_relative "../test/dummy/config/environment"
require "rails/test_help"

# For generators
require "rails/generators/test_case"
require "generators/tailwind_theme/install/install_generator"
