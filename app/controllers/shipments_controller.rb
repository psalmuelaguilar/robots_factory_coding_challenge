class ShipmentsController < ApplicationController
  def create
    robots = Robot.where(id: params[:shipmentRobots])
    robots.each do |robot|
      Shipment.create(robot_id: robot.id)
    end
  end
end
