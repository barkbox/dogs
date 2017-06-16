require 'active_support/configurable'

module Dogs

  class Configuration
    attr_accessor :base_api_controller

    def initialize
      @base_api_controller = nil
    end
  end
end
