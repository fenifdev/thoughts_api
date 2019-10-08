class ThoughtsController < ApplicationController
  def index
    thoughts = Thought.all
    render json: { data: thoughts }
  end

  def show
    thought = Thought.find(params[:id])
    render json: { data: thought }

    rescue ActiveRecord::RecordNotFound
        render json: { error: "Thought does not exist" }, status: :not_found
  end
end
