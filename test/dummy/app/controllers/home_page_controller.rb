# frozen_string_literal: true

class HomePageController < ApplicationController
  def index
    render json: theme[nil]
  end
end
