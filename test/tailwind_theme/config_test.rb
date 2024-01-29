# frozen_string_literal: true

require 'test_helper'

class ConfigTest < ActiveSupport::TestCase
  test "load paths includes Rails.root as the first path" do
    assert_equal Rails.root.join("config"), TailwindTheme.load_paths.first
  end

  test "adds the fixtures path as the second path" do
    assert_equal File.expand_path("../fixtures", __dir__), TailwindTheme.load_paths.second
  end
end
