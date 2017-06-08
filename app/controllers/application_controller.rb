class ApplicationController < ::ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def authenticate
    super 
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
