class RobotSerializer < BaseSerializer
  attributes :id, :name, :configuration, :statuses

  def configuration
    ConfigurationSerializer.new(object.configuration).attributes
  end
end
