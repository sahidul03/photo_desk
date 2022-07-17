module ErrorHandler
  extend ActiveSupport::Concern

  included do
    # Caution
    #
    # The order in which rescue_from picks up errors is from the bottom of the code you write to the top.
    # Therefore, if you write your code on a line above StandardError, it will not be picked up, so be careful.

    rescue_from Exception do |e|
      handle_exception(e)
    end

    rescue_from StandardError do |e|
      handle_error(e)
    end

    rescue_from ActiveRecord::RecordNotFound do
      render_error(error: StandardError.new("Not found"), status: :not_found)
    end

    rescue_from ActionController::BadRequest do |e|
      render_error(error: e, status: :bad_request)
    end

    # rescue_from Exceptions::UnauthorizedError do |e|
    #   render_error(error: e, status: :unauthorized)
    # end
  end

  protected

  def unauthorized
    render_error(error: StandardError.new("Not authorized"), status: :unauthorized)
  end

  def render_error(error:, status:)
    render :json => { message: error.message }, status: status
  end

  def handle_error(error)
    Rails.logger.error error
    render_error(error: error, status: error.try("status").present? ? error.status : :internal_server_error)
  end

  def handle_exception(exception)
    Rails.logger.error exception
    render_error(error: exception, status: :internal_server_error)
  end
end
