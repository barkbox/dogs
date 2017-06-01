class DogsController < ApplicationController
  def index
    begin
      paginated_dogs = Dog.where(bark_user_id: users_params).cursor(cursor_params)
      render json: paginated_dogs, each_serializer: V1::DogSerializer
    rescue => e
      render json: { errors: [status: '400', title: 'Bad Request'] }, status: :bad_request
    end
  end

  def show
    begin
      dog = Dog.find(params[:id])
      render json: dog, serializer: V1::DogSerializer
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: [ {status: '404', title:  'Not found'} ] }, status: :not_found
    end
  end

  def create
    begin 
      filtered_params = dog_params
      if params[:image]
        image_url = upload_image(params[:image])
        filtered_params.merge!(image_url: image_url)
      end
      dog = Dog.new(filtered_params)
      dog.save!
      render json: dog, serializer: V1::DogSerializer
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
      dog.update!(filtered_params)
      render json: dog, serializer: V1::DogSerializer
    rescue => e
      render json: { errors: [status: '422', title: e.message] }, status: :unprocessable_entity
    end
  end

  def destroy
    dog = Dog.find(params[:id])
    dog.destroy
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
      response = Cloudinary::Uploader.upload(image, folder: "dog-#{Rails.env}")
      if response['secure_url']
        response['secure_url']
      else
        raise 'unable to upload image to Cloudinary'
      end
    end
end
