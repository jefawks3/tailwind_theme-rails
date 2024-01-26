# frozen_string_literal: true

class AdminUsersController < AdminController
  def index
    render json: theme[nil]
  end
end
