# frozen_string_literal: true

require "rails"
require "tailwind_theme"
require "tailwind_theme/rails/version"
require "tailwind_theme/factory"
require "tailwind_theme/controller_concern"
require "tailwind_theme/engine"

module TailwindTheme
  mattr_writer :load_paths

  def self.load_paths
    @@load_paths ||= [::Rails.root.join("config")]
  end
end