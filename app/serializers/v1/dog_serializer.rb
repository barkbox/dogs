module V1
  class DogSerializer < ActiveModel::Serializer
    attributes :id, :bark_user_id, :birthday, :image_url, :name, :size
  end
end