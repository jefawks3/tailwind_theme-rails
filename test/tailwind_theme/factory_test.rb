# frozen_string_literal: true

require 'test_helper'

class FactoryTest < ActiveSupport::TestCase

  test "load default theme" do
    theme = TailwindTheme::Factory.new.theme
    assert_equal "default", theme[:_theme]
    assert_equal "default", theme.name
  end

  test "load alternative theme" do
    theme = TailwindTheme::Factory.new.theme :admin
    assert_equal "admin", theme[:_theme]
    assert_equal "admin", theme.name
  end

  test "load test-theme from alternative location" do
    theme = TailwindTheme::Factory.new.theme "test-theme"
    assert_equal "test-theme", theme[:_theme]
    assert_equal "test-theme", theme.name
  end
end
