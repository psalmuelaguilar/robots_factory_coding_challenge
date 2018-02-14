class RobotsController < ApplicationController
  def index
    robots = Robot.includes(:configuration).page(params[:page]).per(per_batch)
    render json: robots, each_serializer: RobotSerializer, root: 'data'
  end

  def recycle
  end

  def extinguish
  end

  private

  def per_batch
    per_batch = params[:per_page] || params[:batches] || 10
  end

end
