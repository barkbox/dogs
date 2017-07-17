require 'rails_helper'

RSpec.describe V1::DogSerializer do

  let(:dog) { build(:dog) }
  let(:options) {{ serializer: V1::DogSerializer, adapter: :json_api, key_transform: :underscore }}
  let(:json) { JSON.parse(ActiveModelSerializers::SerializableResource.new(dog, options).to_json) }

  it 'serializes correct attributes' do
    ['user_id', 'birthday', 'image_url', 'name', 'size', 'sex', 'breed'].each do |key|
      expect(json['data']['attributes']).to include(key)
    end
  end
end
