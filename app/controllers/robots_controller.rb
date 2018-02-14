class RobotsController < ApplicationController
  before_action :find_robot, only: [:extinguish]
  def index
    robots =
      Robot.includes([:configuration, :shipment])
           .where(shipments: { id: nil })
           .page(params[:page])
           .per(per_batch)

    render json: robots, each_serializer: RobotSerializer, root: 'data'
  end

  def recycle
    robots = Robot.where(id: params[:recycleRobots]).where("'on_fire' = ANY (statuses)").update_all(statuses: ['recycle'])
    render json: { data: { message: 'Successfully Recycled' } }
  end

  def extinguish
    @robot.update_attributes(statuses: @robot.statuses.delete('on_fire'))
    render json: { data: { message: 'Successfully Extinguished' } }
  end

  private

  def per_batch
    per_batch = params[:per_page] || params[:batches] || 10
  end

  def find_robot
    @robot = Robot.find(params[:id])
  end
end
