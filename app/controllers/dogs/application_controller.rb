module Dogs
  class ApplicationController < Dogs.host_base_api_controller
    protect_from_forgery unless: -> { request.format.json? }
  end
end
