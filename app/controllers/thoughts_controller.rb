class ThoughtsController < ApplicationController
  def index
    thoughts = Thought.all
    render json: { data: thoughts }
  end
end
