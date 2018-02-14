require 'rails_helper'

RSpec.describe ShipmentsController, type: :controller do
  describe '#POST create' do
    let(:robot) { create(:robot) }
    let(:robot_params) { [robot.id] }
    it 'should create shipments based on robot_ids' do
      post :create, params: { recycleRobots: robot_params }
      expect(response).to be_success
      expect(Shipment.count).to eq(robot_params.count)
    end
  end
end
