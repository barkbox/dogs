module Dogs
  class Engine < ::Rails::Engine
    require 'active_model_serializers'
    require 'acts_as_paranoid'
    require 'cloudinary'
    require 'paging_cursor'
    require 'rails'

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
