# p Rails.root
# require '../../lib/unauthenticated_error.rb'

class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  around_filter :catch_errors

  # expect host app to implement :catch_errors, :authenticate, :authenticate_admin, :authorize_for_resource, :authorize_for_resources, :cursor_params

  def catch_errors
    # example
    yield
  rescue UnauthenticatedError => e
    json = { errors: [ { status: '401', title: e.message } ] }
    render json: json, status: :unauthorized
  rescue => e
    json = { errors: [ { status: '400', title:  e.message } ] }
    render json: json, status: :bad_request
  end

  def authenticate
    # example
    raise UnauthenticatedError if current_user.nil?
  end

  def authenticate_admin
    # example
    raise UnauthenticatedError if current_user.nil? || !current_user.is_admin?
  end

  def authorize_for_resource(resource)
    # example
    return if current_user.is_admin
    return if resource.is_a?(User) && resource.id == current_user.id
    if current_user.id != resource.try(:user_id)
      raise 'Unauthorized for resource'
    end
  end

  def authorize_for_resources(resources)
    # example
    return if current_user.is_admin
    if resources.where.not(user_id: current_user.id).present?
      raise 'Unauthorized for resource'
    end
  end

  private

  def current_user
    # set current_user in specs
  end

  def cursor_params
    # example
    if params[:cursor] && (params[:cursor].has_key?('before') || params[:cursor].has_key?('after'))
      return params[:cursor]
    else
      return { before: nil }
    end
  end
end
