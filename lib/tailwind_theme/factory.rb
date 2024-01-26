# frozen_string_literal: true

module TailwindTheme
  # Theme factory to load and cache a theme.
  #
  # @example
  #
  #     TailwindTheme::Factory.new.theme
  #
  # @example
  #
  #     TailwindTheme::Factory.new.theme :admin
  #
  class Factory
    def initialize(config_dir = nil)
      @config_dir = config_dir || ::Rails.root.join("config").to_s
      @themes = {}
    end

    # Load and cache the theme.
    #
    # @param [String, Symbol] name the name of the theme to load. Nil will load the default theme.
    #
    # The default theme load order:
    #   1) themes/default.yml(.erb)
    #   2) theme.yml(.erb)
    #
    # @return [TailwindTheme::Theme, NilClass] returns the theme or nil if the theme cannot be found.
    def theme(name = nil)
      if name.nil? || name.to_s == "default"
        default_theme
      else
        theme_by_name name
      end
    end

    private

    def default_theme
      return @themes[:default] if @themes[:default]

      files = Dir[
        File.expand_path("themes/default.{yml,yml.erb}"),
        File.expand_path("theme.{yml,yml.erb}", @config_dir)
      ]

      load_theme :default, files
    end

    def theme_by_name(name)
      return @themes[name.to_sym] if @themes[name.to_sym]

      files = Dir[File.expand_path("themes/#{name}.{yml,yml.erb}", @config_dir)]
      load_theme name, files
    end

    def load_theme(name, files)
      return if files.empty?

      theme = TailwindTheme.load_file files.first.to_s
      theme.instance_eval <<-RUBY
def name
  "#{name}"
end
      RUBY

      @themes[name.to_sym] = theme
    end
  end
end
