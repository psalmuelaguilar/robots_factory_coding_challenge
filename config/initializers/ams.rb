require 'active_model_serializers'

ActiveModelSerializers.config.key_transform = :underscore
ActiveModelSerializers.config.adapter = :json
