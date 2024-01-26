# frozen_string_literal: true

class AdminController < ApplicationController
  theme "admin"

  def index
    render json: theme[nil]
  end
end
