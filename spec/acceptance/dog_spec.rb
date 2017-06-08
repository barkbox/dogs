require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Dogs' do
  def authenticated_helper
    allow_any_instance_of(ApplicationController).to receive(:authenticate).and_return(nil)
  end

  def not_authenticated_helper
    allow_any_instance_of(ApplicationController).to receive(:authenticate).and_raise('unauthenticated error')
  end

  def authorized_helper
    allow_any_instance_of(ApplicationController).to receive(:authorize_for_resource).and_return('')
    allow_any_instance_of(ApplicationController).to receive(:authorize_for_resources).and_return('')
  end

  def not_authorized_helper
    allow_any_instance_of(ApplicationController).to receive(:authorize_for_resource).and_raise('not authorized error')
    allow_any_instance_of(ApplicationController).to receive(:authorize_for_resources).and_raise('not authorized error')
  end

  before do
    allow_any_instance_of(DogsController).to receive(:upload_image).and_return('https://www.example_image_url.jpg')
  end

  let!(:dog_1) { create(:dog) }
  let!(:dog_2) { create(:dog) }

  get '/dogs' do
    parameter :bark_user_ids, 'Array of one or more BarkBox user ids', required: true

    describe 'returns paginated response of specified dogs' do
      let!(:dog_3) { create(:dog) }
      let(:bark_user_ids) { [dog_1.bark_user_id, dog_2.bark_user_id] }
      example do
        do_request
        json = JSON.parse(response_body)
        expect(Dog.count).to eq(3)
        expect(json['data'].count).to eq(2)
        status.should == 200
      end
    end

    example 'bark_user_ids not provided' do
      do_request
      status.should == 400
    end

    describe 'must be authorized' do
      context 'authenticated' do
        parameter :bark_user_ids, 'Array of one or more BarkBox user ids', required: true
        let(:bark_user_ids) { [dog_1.bark_user_id, dog_2.bark_user_id] }
        example do
          authorized_helper
          do_request
          json = JSON.parse(response_body)
          expect(json['data'].count).to eq(2)
          status.should == 200
        end
      end

      context 'not authorized' do
        parameter :bark_user_ids, 'Array of one or more BarkBox user ids', required: true
        let(:bark_user_ids) { [dog_1.bark_user_id, dog_2.bark_user_id] }
        example do
          not_authorized_helper
          do_request
          status.should == 400
        end
      end
    end
  end

  get '/dogs/:id' do
    let(:id) { dog_1.id }
    context 'authorized' do
      example 'list specific dog' do
        authorized_helper
        do_request
        status.should == 200
      end

      describe 'attempting to list dog that does not exist' do
        let(:id) { 123456 }
        example do
          do_request
          status.should == 404
        end
      end
    end

    context 'not authorized' do
      example do
        not_authorized_helper
        do_request
        status.should == 404
      end
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

    context 'authenticated' do
      example 'creates dog' do
        authenticated_helper
        expect{ do_request }.to change{ Dog.count }.by(1)
        status.should == 200
      end
    end

    context 'not authenticated' do
      example 'does not create dog' do
        not_authenticated_helper
        expect{ do_request }.to_not change{ Dog.count }
        status.should == 422
      end
    end
  end

  patch '/dogs/:id' do
    parameter :name
    parameter :size

    let(:id) { dog_1.id }
    let(:name) { 'Doge Bryant'  }
    let(:size) { 'L' }

    context 'authorized' do
      example 'updates dog' do
        authorized_helper
        do_request
        dog_1.reload
        expect(dog_1.name).to eq('Doge Bryant')
        expect(dog_1.size).to eq('L')
        status.should == 200
      end
    end

    context 'unauthorized' do
      example 'does update dog' do
        not_authorized_helper
        do_request
        dog_1.reload
        expect(dog_1.name).to_not eq('Doge Bryant')
        expect(dog_1.size).to_not eq('L')
        status.should == 422
      end
    end
  end

  delete '/dogs/:id' do
    let(:id) { dog_1.id }
    context 'authorized' do
      example 'deletes dog' do
        authorized_helper
        expect{ do_request }.to change{ Dog.count }.by(-1)
        status.should == 204
      end
    end

    context 'not authorized' do
      example 'does not delete dog' do
        not_authorized_helper
        dog_count = Dog.count
        do_request
        expect(Dog.count).to eq(dog_count)
        status.should == 204
      end
    end
  end
end