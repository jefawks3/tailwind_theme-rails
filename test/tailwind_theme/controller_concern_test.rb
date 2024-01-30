# frozen_string_literal: true

require 'test_helper'

class ControllerConcernTest < ActiveSupport::TestCase
  test "default theme" do
    assert "default", HomePageController.new.theme.name
    assert "default", ApplicationController.new.theme.name
  end

  test "inheritance" do
    assert "admin", AdminUsersController.new.theme.name
  end

  test "load a different them" do
    assert "admin", ApplicationController.new.theme(:admin).name
  end
end
