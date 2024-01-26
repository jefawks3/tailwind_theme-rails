# frozen_string_literal: true

module TailwindTheme
  class Engine < ::Rails::Engine # :nodoc:


    initializer "tailwind_merge.setup_controller_theme" do |app|
      ActiveSupport.on_load(:action_controller) do
        ActionController::Base.include TailwindTheme::ControllerConcern
      end
    end
  end
end
