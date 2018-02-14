require 'rails_helper'

RSpec.describe RobotsController, type: :controller do
  describe 'GET index' do
    let!(:robot) { create(:robot) }
    let!(:configuration) { create(:configuration, robot_id: robot.id) }
    let(:robot_pattern) do
      {
        id: robot.id,
        name: String,
        configuration: {
          hasSentience: configuration.has_sentience,
          hasWheels: configuration.has_wheels,
          hasTracks: configuration.has_tracks,
          numberOfRotors: Integer,
          colour: String
        },
        statuses: Array
      }
    end

    context 'no batch params' do
      it 'gets all robots' do
        get :index
        expect(response).to be_success
        expect(response.body).to match_json_expression(data: [robot_pattern])
      end
    end

    context 'has batch params' do
      let!(:robot_2) { create(:robot) }
      let!(:configuration_2) { create(:configuration, robot_id: robot_2.id) }

      let(:robot_pattern_2) do
        {
          id: robot_2.id,
          name: String,
          configuration: {
            hasSentience: configuration.has_sentience,
            hasWheels: configuration.has_wheels,
            hasTracks: configuration.has_tracks,
            numberOfRotors: Integer,
            colour: String
          },
          statuses: Array
        }
      end

      it 'gets all robots with batches' do
        get :index, params: { batches: 1, page: 2}
        expect(response).to be_success
        expect(response.body).to match_json_expression(data: [robot_pattern_2])
      end
    end
  end

  describe 'PUT #extinguish' do
    let!(:robot) { create(:robot, statuses: ['on_fire']) }
    let(:params) { { id: brand.id } }
    it 'should remove robot onfire status' do
      put :extinguish, params: { id: robot.id }
      robot.reload
      expect(response).to be_success
      expect(robot.statuses).to be_empty
    end
  end

  describe 'PUT #recycle' do
    context 'all robot status are recyclable' do
      let(:robot) { create(:robot) }
      let(:robot_params) do
        {
          recycleRobots: [1]
        }
      end
      it 'should put the robots statuses to recycle' do
        put :recycle_robot, params: robot_params
        expect(response).to be_success
        expect(robot).to eq(['recycle'])
      end
    end

    context 'No robots are recyclable' do
      let(:robot) { create(:robot) }
      it 'should not update the robot status' do
        put :recycle_robot, params: recycle_params
        expect(response).to be_success
        expect(robot.status).to eq([])
      end
    end
  end
end
