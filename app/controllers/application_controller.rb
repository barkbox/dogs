# class ApplicationController < Dogs.host_base_api_controller
class ApplicationController < ::ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
oewdh
  def authenticate
    superwkehbd
  end

  def authenticate_admin
    super
  end

  def authorize_for_resource(resource)
    super
  end

  def authorize_for_resources(resources)
    super
  end
end
