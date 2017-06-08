class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  # expect host app to implement :authenticate, :authenticate_admin, :authorize_for_resource, :authorize_for_resources
  def authenticate
    # example
    # raise BarkboxClient::UnauthenticatedError if current_user.nil?
  end

  def authenticate_admin
    # example
    # raise BarkboxClient::UnauthenticatedError if current_user.nil? || !current_user.is_admin?
  end

  def authorize_for_resource(resource)
    # example
    # return if current_user.is_admin
    # return if resource.is_a?(User) && resource.id == current_user.id
    # if current_user.id != resource.try(:user_id)
    #   raise 'Unauthorized for resource'
    # end
  end

  def authorize_for_resources(resources)
    # example
    # return if current_user.is_admin
    # if resources.where.not(user_id: current_user.id).present?
    #   raise 'Unauthorized for resource'
    # end
  end
end
