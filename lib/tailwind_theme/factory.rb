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
    def initialize
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
        @themes[:default] ||= load_default_theme
      else
        @themes[name.to_sym] = load_by_name name.to_sym
      end
    end

    private

    def load_default_theme
      load_theme :default, %w[themes/default.{yml,yml.erb} theme.{yml,yml.erb}]
    end

    def load_by_name(name)
      load_theme name, %W[themes/#{name}.{yml,yml.erb}]
    end

    def find_theme(paths)
      patterns = TailwindTheme.load_paths.each_with_object([]) do |dir, patterns|
        paths.each do |path|
          patterns << File.expand_path(path, dir)
        end
      end

      Dir.glob(patterns, 0).first
    end

    def load_theme(name, files)
      file = find_theme files
      return unless file

      theme = TailwindTheme.load_file file.to_s
      theme.instance_eval <<-RUBY
def name
  "#{name}"
end
      RUBY

      theme
    end
  end
end
