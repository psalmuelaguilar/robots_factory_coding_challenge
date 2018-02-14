class BaseSerializer < ActiveModel::Serializer
  def serializer_params
    (instance_options[:serializer_params] || {}).to_h
  end
end
