# frozen_string_literal: true

require "active_support/concern"

module TailwindTheme
  # Adds the methods and helpers to the controller for setting and getting the TailwindTheme
  module ControllerConcern
    extend ActiveSupport::Concern

    included do
      class_attribute :_theme, default: :default # :nodoc:

      # Add the helper method for the views
      helper_method :theme
    end

    class_methods do
      # Set the TailwindTheme for the controller
      #e
      # @param [String, Symbol, NilClass] name the name of the theme to use. Defaults to nil.
      #
      # When `name` is nil, :default, or "default", the default theme will be used.
      #
      # See the [Factory](#Factory) class for more details
      def theme(name)
        self._theme = name.presence || :default
      end
    end

    # The specified TailwindTheme for the controller
    # @param [String, Symbol, NilClass] name the name of the theme to use. Defaults to the theme set by the `theme`
    #   class method.
    # @return [TailwindTheme::Theme, NilClass] returns the specified theme or Nil if the theme is not defined.
    def theme(name = nil)
      theme_factory.theme(name.presence || self.class._theme)
    end

    private

    def theme_factory
      Factory.new
    end
  end
end
