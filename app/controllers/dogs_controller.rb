class DogsController < Dogs::ApplicationController
  before_action :authenticate

  def index
    if params[:user_id]
      dogs = Dog.where(user_id: params[:user_id])
    else
      dogs = Dog.all
    end
    authorize_for_resources(dogs)
    render json: dogs.cursor(cursor_params), each_serializer: V1::DogSerializer
  end

  def show
    dog = Dog.find(params[:id])
    authorize_for_resource(dog)
    render json: dog, serializer: V1::DogSerializer
  end

  def create
    filtered_params = dog_params
    if params[:image].present?
      image_url = upload_image(params[:image])
      filtered_params.merge!(image_url: image_url)
    end
    dog = Dog.new(filtered_params)
    dog.save
    render json: dog, serializer: V1::DogSerializer
  end

  def update
    filtered_params = dog_params
    if params[:image].present?
      image_url = upload_image(params[:image])
      filtered_params.merge!(image_url: image_url)
    end
    dog = Dog.find(params[:id])
    authorize_for_resource(dog)
    dog.update(filtered_params)
    render json: dog, serializer: V1::DogSerializer
  end

  def destroy
    dog = Dog.find(params[:id])
    authorize_for_resource(dog)
    dog.destroy
    render json: dog, serializer: V1::DogSerializer
  end

  private

  def dog_params
    params.permit(:name, :birthday, :size, :user_id)
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
