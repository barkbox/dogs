require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Dogs" do
  before do
    DogsController.any_instance.stub(:upload_image).and_return('https://www.example_image_url.jpg')
  end

  let!(:dog_1) { create(:dog) }
  let!(:dog_2) { create(:dog) }

  get '/dogs' do
    parameter :bark_user_ids, 'Array of one or more BarkBox user ids', required: true

    let!(:dog_3) { create(:dog) }
    let(:bark_user_ids) { [dog_1.bark_user_id, dog_2.bark_user_id] }
    example 'returns paginated response of specified dogs' do
      do_request
      json = JSON.parse(response_body)
      expect(Dog.count).to eq(3)
      expect(json['data'].count).to eq(2)
      status.should == 200
    end

  end

  get '/dogs' do
    parameter :bark_user_ids, 'Array of one or more BarkBox user ids', required: true
    example 'bark_user_ids not provided' do
      do_request
      status.should == 400
    end
  end

  get '/dogs/:id' do
    let(:id) { dog_1.id }
    example "list specific dog" do
      do_request
      status.should == 200
    end
  end


  get '/dogs/:id' do
    let(:id) { 123456 }
    example "attempting to list dog that does not exist" do
      do_request
      status.should == 404
    end
  end

  post '/dogs' do
    parameter :bark_user_id, required: true
    parameter :birthday, 'Any object that can be stored as DateTime'
    parameter :image, 'Can be image file, IO object, or url'
    parameter :name
    parameter :size

    let(:bark_user_id) { dog_1.bark_user_id }
    let(:birthday) { dog_1.birthday }
    let(:image) { dog_1.image_url }
    let(:name) { dog_1.name }
    let(:size) { dog_1.size }

    example "create dog" do
      expect{ do_request }.to change{ Dog.count }.by(1)
      status.should == 200
    end
  end

  patch '/dogs/:id' do
    parameter :name
    parameter :size

    let(:id) { dog_1.id }
    let(:name) { 'Doge Bryant'  }
    let(:size) { 'L' }

    example "update dog" do
      do_request
      dog_1.reload
      expect(dog_1.name).to eq('Doge Bryant')
      expect(dog_1.size).to eq('L')
      status.should == 200
    end
  end

  delete '/dogs/:id' do
    let(:id) { dog_1.id }
    example "delete dog" do
      expect{ do_request }.to change{ Dog.count }.by(-1)

      status.should == 204
    end
  end
end