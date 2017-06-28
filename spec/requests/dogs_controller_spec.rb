require 'rails_helper'

describe 'DogsController', type: :request do
  let(:options) {{ namespace: V1, adapter: :json_api }}

  before do
    options[:serialization_context] = nil # serialization_context should be reset on each request
  end

  context 'GET /dogs' do

    shared_examples_for 'a successful request' do
      before do
        create(:dog, user_id: resource_owner.id)
      end

      specify do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(acting_user)
        get dogs_path

        response_json = JSON.parse(response.body)

        options[:serialization_context] = serialization_context(request)

        expect(response).to be_ok
        expect(response_json).to eq(serialize(Dog.all, options))
      end
    end

    shared_examples_for 'an unsuccessful request' do
      before do
        create(:dog, user_id: resource_owner.id)
      end

      specify do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(acting_user)
        get dogs_path

        response_json = JSON.parse(response.body)

        expect(response).to_not be_ok
        expect(response.status).to eq(status)
        expect(response_json['errors'][0]['title']).to eq(error_message)
      end
    end

    context 'acting user is admin' do
      let(:acting_user) { create(:admin) }
      let(:resource_owner) { create(:user) }
      it_behaves_like 'a successful request'
    end

    context 'acting user is not admin' do
      let(:acting_user) { create(:user) }
      let(:resource_owner) { create(:user) }
      let(:status) { 400 }
      let(:error_message) { 'Unauthorized for resource' }
      it_behaves_like 'an unsuccessful request'
    end

    context 'acting user not authenticated' do
      let(:acting_user) { nil }
      let(:resource_owner) { create(:user) }
      let(:status) { 401 }
      let(:error_message) { 'UnauthenticatedError' }
      it_behaves_like 'an unsuccessful request'
    end
  end

  context 'GET /users/:id/dogs' do

    shared_examples_for 'a successful request' do
      before do
        create(:dog, user_id: resource_owner.id)
      end

      specify do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(acting_user)
        get dogs_path({ user_id: resource_owner.id })

        response_json = JSON.parse(response.body)
        dogs = Dog.where(user_id: resource_owner.id)

        options[:serialization_context] = serialization_context(request)

        expect(response).to be_ok
        expect(response_json).to eq(serialize(dogs, options))
      end
    end

    shared_examples_for 'an unsuccessful request' do
      before do
        create(:dog, user_id: resource_owner.id)
      end

      specify do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(acting_user)
        get dogs_path({ user_id: resource_owner.id })

        response_json = JSON.parse(response.body)

        expect(response).to_not be_ok
        expect(response.status).to eq(status)
        expect(response_json['errors'][0]['title']).to eq(error_message)
      end
    end

    context 'acting user is admin' do
      let(:acting_user) { create(:admin) }
      let(:resource_owner) { create(:user) }
      it_behaves_like 'a successful request'
    end

    context 'acting user is resource owner' do
      let(:acting_user) { create(:user) }
      let(:resource_owner) { acting_user }
      it_behaves_like 'a successful request'
    end

    context 'acting user is not admin or resource owner' do
      let(:acting_user) { create(:user) }
      let(:resource_owner) { create(:user) }
      let(:status) { 400 }
      let(:error_message) { 'Unauthorized for resource' }
      it_behaves_like 'an unsuccessful request'
    end

    context 'acting user not authenticated' do
      let(:acting_user) { nil }
      let(:resource_owner) { create(:user) }
      let(:status) { 401 }
      let(:error_message) { 'UnauthenticatedError' }
      it_behaves_like 'an unsuccessful request'
    end
  end

  context 'GET /dogs/:id' do

    shared_examples_for 'a successful request' do
      before do
        @dog = create(:dog, user_id: resource_owner.id)
      end

      specify do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(acting_user)
        get dog_path({ id: @dog.id })

        response_json = JSON.parse(response.body)

        options[:serialization_context] = serialization_context(request)

        expect(response).to be_ok
        expect(response_json).to eq(serialize(@dog, options))
      end
    end

    shared_examples_for 'an unsuccessful request' do
      before do
        @dog = create(:dog, user_id: resource_owner.id)
      end

      specify do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(acting_user)
        get dog_path({ id: @dog.id })

        response_json = JSON.parse(response.body)

        expect(response).to_not be_ok
        expect(response.status).to eq(status)
        expect(response_json['errors'][0]['title']).to eq(error_message)
      end
    end

    context 'acting user is admin' do
      let(:acting_user) { create(:admin) }
      let(:resource_owner) { create(:user) }
      it_behaves_like 'a successful request'
    end

    context 'acting user is resource owner' do
      let(:acting_user) { create(:user) }
      let(:resource_owner) { acting_user }
      it_behaves_like 'a successful request'
    end

    context 'acting user is not admin or resource owner' do
      let(:acting_user) { create(:user) }
      let(:resource_owner) { create(:user) }
      let(:status) { 400 }
      let(:error_message) { 'Unauthorized for resource' }
      it_behaves_like 'an unsuccessful request'
    end

    context 'acting user not authenticated' do
      let(:acting_user) { nil }
      let(:resource_owner) { create(:user) }
      let(:status) { 401 }
      let(:error_message) { 'UnauthenticatedError' }
      it_behaves_like 'an unsuccessful request'
    end
  end

  context 'POST /dogs' do

    shared_examples_for 'a successful request' do
      specify do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(acting_user)
        allow_any_instance_of(DogsController).to receive(:upload_image).and_return('https://www.example_image_create.jpg')
        params = {
          user_id: resource_owner.id,
          name: 'Cristiano Ruffnaldo',
          birthday: DateTime.new(2012,11,4),
          size: 'M',
          sex: 'M',
          image: 'https://www.example_image_create.jpg'
        }
        post dogs_path(params)

        response_json = JSON.parse(response.body)

        options[:serialization_context] = serialization_context(request)

        expect(response).to be_ok
        expect(response_json).to eq(serialize(Dog.last, options))
      end
    end

    shared_examples_for 'an unsuccessful request' do
      specify do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(acting_user)
        post dogs_path({})

        response_json = JSON.parse(response.body)

        expect(response).to_not be_ok
        expect(response.status).to eq(status)
        expect(response_json['errors'][0]['title']).to eq(error_message)
      end
    end

    context 'acting user is authenticated' do
      let(:acting_user) { create(:user) }
      let(:resource_owner) { acting_user }
      it_behaves_like 'a successful request'
    end

    context 'acting user not authenticated' do
      let(:acting_user) { nil }
      let(:resource_owner) { create(:user) }
      let(:status) { 401 }
      let(:error_message) { 'UnauthenticatedError' }
      it_behaves_like 'an unsuccessful request'
    end
  end

  context 'PUT /dogs/:id' do

    shared_examples_for 'a successful request' do
      before do
        @dog = create(:dog, user_id: resource_owner.id)
      end

      specify do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(acting_user)
        allow_any_instance_of(DogsController).to receive(:upload_image).and_return('https://www.example_image_update.jpg')
         params = {
          id: @dog.id,
          name: 'Pickles',
          birthday: DateTime.new(2012,11,4),
          size: 'S',
          sex: 'F',
          image: 'https://www.example_image_update.jpg'
        }
        put dog_path(params)

        response_json = JSON.parse(response.body)

        expect(response).to be_ok
        expect(response_json).to eq(serialize(@dog.reload, options))
        expect(response_json['data']['attributes']['name']).to eq('Pickles')
        expect(response_json['data']['attributes']['size']).to eq('S')
        expect(response_json['data']['attributes']['sex']).to eq('F')
        expect(response_json['data']['attributes']['image_url']).to eq('https://www.example_image_update.jpg')
        expect(DateTime.parse(response_json['data']['attributes']['birthday'])).to eq(DateTime.new(2012,11,4))
      end
    end

    shared_examples_for 'an unsuccessful request' do
      before do
        @dog = create(:dog, user_id: resource_owner.id)
      end

      specify do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(acting_user)
        put dog_path({id: @dog.id})

        response_json = JSON.parse(response.body)

        expect(response).to_not be_ok
        expect(response.status).to eq(status)
        expect(response_json['errors'][0]['title']).to eq(error_message)
      end
    end

    context 'acting user is admin' do
      let(:acting_user) { create(:admin) }
      let(:resource_owner) { create(:user) }
      it_behaves_like 'a successful request'
    end

    context 'acting user is resource owner' do
      let(:acting_user) { create(:user) }
      let(:resource_owner) { acting_user }
      it_behaves_like 'a successful request'
    end

    context 'acting user is not admin or resource owner' do
      let(:acting_user) { create(:user) }
      let(:resource_owner) { create(:user) }
      let(:status) { 400 }
      let(:error_message) { 'Unauthorized for resource' }
      it_behaves_like 'an unsuccessful request'
    end

    context 'acting user not authenticated' do
      let(:acting_user) { nil }
      let(:resource_owner) { create(:user) }
      let(:status) { 401 }
      let(:error_message) { 'UnauthenticatedError' }
      it_behaves_like 'an unsuccessful request'
    end
  end

  context 'DELETE /dogs/:id' do

    shared_examples_for 'a successful request' do
      before do
        @dog = create(:dog, user_id: resource_owner.id)
      end

      specify do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(acting_user)
        delete dog_path({ id: @dog.id })

        response_json = JSON.parse(response.body)

        expect(response).to be_ok
        expect(response_json).to eq(serialize(@dog, options))
      end
    end

    shared_examples_for 'an unsuccessful request' do
      before do
        @dog = create(:dog, user_id: resource_owner.id)
      end

      specify do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(acting_user)
        delete dog_path({ id: @dog.id })

        response_json = JSON.parse(response.body)

        expect(response).to_not be_ok
        expect(response.status).to eq(status)
        expect(response_json['errors'][0]['title']).to eq(error_message)
      end
    end

    context 'acting user is admin' do
      let(:acting_user) { create(:admin) }
      let(:resource_owner) { create(:user) }
      it_behaves_like 'a successful request'
    end

    context 'acting user is resource owner' do
      let(:acting_user) { create(:user) }
      let(:resource_owner) { acting_user }
      it_behaves_like 'a successful request'
    end

    context 'acting user is not admin or resource owner' do
      let(:acting_user) { create(:user) }
      let(:resource_owner) { create(:user) }
      let(:status) { 400 }
      let(:error_message) { 'Unauthorized for resource' }
      it_behaves_like 'an unsuccessful request'
    end

    context 'acting user not authenticated' do
      let(:acting_user) { nil }
      let(:resource_owner) { create(:user) }
      let(:status) { 401 }
      let(:error_message) { 'UnauthenticatedError' }
      it_behaves_like 'an unsuccessful request'
    end
  end
end
