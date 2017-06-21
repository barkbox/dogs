module SerializerHelpers

  KlassStruct = Struct.new(:class)

  def serialize obj, options={}
    klass_struct = KlassStruct.new(obj.try(:klass) || obj.class) # ActiveRecord::Relation responds to `klass`
    options[:each_serializer] = ActiveModel::Serializer.serializer_for(klass_struct, namespace: options[:namespace])
    JSON.parse(ActiveModelSerializers::SerializableResource.new(obj, options).to_json)
  end

  # for cursor pagination with AMS
  def serialization_context request
    options[:serialization_context] = OpenStruct.new(
      request_url: request.original_url.split('?')[0], # url without query params
      query_parameters: request.query_parameters
    )
  end
end
