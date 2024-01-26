# frozen_string_literal: true

require 'rails/generators/base'

module TailwindTheme
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __dir__)

      desc "Creates a default TailwindTheme file."

      class_option :erb

      def copy_default_theme
        @theme_name = "default"
        template "theme.yml", "config/theme.yml#{".erb" if !!options[:erb]}"
      end

      def copy_alternative_theme
        @theme_name = "alternative"
        template "theme.yml", "config/themes/alternative.yml#{".erb" if !!options[:erb]}"
      end
    end
  end
end