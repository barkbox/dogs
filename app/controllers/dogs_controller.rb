class DogsController < ApplicationController
  def index
    begin
      dogs = Dog.where(bark_user_id: users_params)
      authorize_for_resources(dogs)
      render json: dogs.cursor(cursor_params), each_serializer: V1::DogSerializer, adapter: :json_api, key_transform: :underscore
    rescue => e
      render json: { errors: [status: '400', title: 'Bad Request'] }, status: :bad_request
    end
  end

  def show
    begin
      dog = Dog.find(params[:id])
      authorize_for_resource(dog)
      render json: dog, serializer: V1::DogSerializer, adapter: :json_api, key_transform: :underscore
    rescue => e
      render json: { errors: [ {status: '404', title:  'Not found'} ] }, status: :not_found
    end
  end

  def create
    begin 
      authenticate
      filtered_params = dog_params
      if params[:image]
        image_url = upload_image(params[:image])
        filtered_params.merge!(image_url: image_url)
      end
      dog = Dog.new(filtered_params)
      dog.save!
      render json: dog, serializer: V1::DogSerializer, adapter: :json_api, key_transform: :underscore
    rescue => e
      render json: { errors: [status: '422', title: e.message] }, status: :unprocessable_entity
    end
  end

  def update
    begin
      filtered_params = dog_params
      if params[:image]
        image_url = upload_image(params[:image])
        filtered_params.merge!(image_url: image_url)
      end
      dog = Dog.find(params[:id])
      authorize_for_resource(dog)
      dog.update!(filtered_params)
      render json: dog, serializer: V1::DogSerializer, adapter: :json_api, key_transform: :underscore
    rescue => e
      render json: { errors: [status: '422', title: e.message] }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      dog = Dog.find(params[:id])
      authorize_for_resource(dog)
      dog.destroy
    rescue => e
    end
    head :no_content
  end

  private
    def cursor_params
      if params[:cursor] && params[:cursor].has_key?(:after)
        { after: params[:cursor][:after] }
      elsif params[:cursor] && params[:cursor].has_key?(:before)
        { before: params[:cursor][:before] }
      else
        { before: nil }
      end
    end

    def dog_params
      params.permit(:image_url, :name, :birthday, :size, :bark_user_id)
    end

    def users_params
      params.require(:bark_user_ids)
    end

    def upload_image(image)
      # Cloudinary::Uploader.upload method handles both image file and image urls
      response = Cloudinary::Uploader.upload(image, folder: "dogs-#{Rails.env}")
      if response['secure_url']
        response['secure_url']
      else
        raise 'unable to upload image to Cloudinary'
      end
    end
end
