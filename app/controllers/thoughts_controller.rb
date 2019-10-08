class ThoughtsController < ApplicationController
  def index
    render json: { data: [] }
  end
end
