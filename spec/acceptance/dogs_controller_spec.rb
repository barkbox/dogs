require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Dogs' do
  let(:admin) { create(:admin) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    allow_any_instance_of(DogsController).to receive(:upload_image).and_return('https://www.example_image_url.jpg')
  end

  get '/dogs' do
    explanation 'Will return all dogs for a user if a user_id parameter is supplied. Otherwise, it will return all dog records'
    parameter :user_id, 'User id', required: false

    let(:dog) { create(:dog) }
    let(:user_id) { dog.user_id }

    example_request 'Get all dogs' do
      expect(status).to eq(200)
    end
  end

  get '/dogs/:id' do
    let(:dog) { create(:dog) }
    let(:id) { dog.id }

    example_request 'Get dog by id' do
      expect(status).to eq(200)
    end
  end

  post '/dogs' do
    parameter :user_id, required: true
    parameter :birthday, 'Any object that can be stored as DateTime'
    parameter :image, 'Can be image file, IO object, or url'
    parameter :name
    parameter :size

    let(:user_id) { 1 }
    let(:birthday) { Time.zone.now }
    let(:image) { 'www.example.com/pickles.jpg' }
    let(:name) { 'Cristiano Ruffnaldo' }
    let(:size) { 'M' }
    let(:sex) { 'M' }

    example_request 'Create dog' do
      expect(status).to eq(200)
    end
  end

  patch '/dogs/:id' do
    explanation 'also able to do via PUT' 
    parameter :name
    parameter :size

    let(:dog) { create(:dog) }
    let(:id) { dog.id }
    let(:name) { 'Doge Bryant'  }
    let(:size) { 'L' }
    let(:sex) { 'F' }

    example_request 'Update dog' do
      expect(status).to eq(200)
    end
  end

  delete '/dogs/:id' do
    let(:dog) { create(:dog) }
    let(:id) { dog.id }

    example_request 'Delete dog' do
      expect(status).to eq(200)
    end
  end
end