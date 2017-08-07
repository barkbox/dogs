module V1
  class DogSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :birthday, :image_url, :name, :size, :sex, :breed, :created_at, :updated_at
  end
end