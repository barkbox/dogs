require 'dogs/config'
require 'dogs/engine'

module Dogs
  class << self
    attr_accessor :config
  end

  def self.config
    @config ||= Configuration.new
  end

  def self.reset
    @config = Configuration.new
  end

  def self.configure
    yield(config)
  end

  def self.host_base_api_controller
    "::#{config.base_api_controller}".constantize
  end

  def self.namespaced_dogs_controller
    "#{config.controller_namespace}::DogsController".constantize
  end
end
