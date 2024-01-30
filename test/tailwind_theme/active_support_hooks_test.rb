# frozen_string_literal: true

require 'test_helper'

class ActiveSupportHooksTest < ActiveSupport::TestCase
  attr_accessor :hook_ran

  def setup
    test = self

    ActiveSupport.on_load :tailwind_theme do
      test.hook_ran = true
    end
  end

  test "make sure the tailwind_theme hook ran" do
    assert :hook_ran
  end
end
