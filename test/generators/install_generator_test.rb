# frozen_string_literal: true

require 'test_helper'

class InstallGeneratorTest < Rails::Generators::TestCase
  tests TailwindTheme::Generators::InstallGenerator
  destination File.expand_path("../../../tmp", __FILE__)
  setup :prepare_destination

  test "assert all files are properly created" do
    run_generator
    assert_file "config/theme.yml", /^_theme:\s"default"\n/
    assert_file "config/themes/alternative.yml", /^_theme:\s"alternative"\n/
  end

  test "assert all erb files are properly created" do
    run_generator(["--erb"])
    assert_file "config/theme.yml.erb", /^_theme:\s"default"\n/
    assert_file "config/themes/alternative.yml.erb", /^_theme:\s"alternative"\n/
  end
end
