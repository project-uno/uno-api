class ApplicationController < ActionController::Base
  # TODO: Add authentication

  protected

  def wrap_in_rescue
    yield
  rescue ActiveRecord::RecordInvalid => error
    render json: {error: error.to_s }, status: :unprocessable_entity
  rescue ActiveRecord::RecordNotFound => error
    render json: {error: error.to_s }, status: :not_found
  end
end
