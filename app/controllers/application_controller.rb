class ApplicationController < ActionController::Base
  # TODO: Add authentication

  def wrap_in_rescue
    yield
  rescue ActiveRecord::RecordInvalid => error
    render json: {error: error.to_s }, status: :unprocessable_entity
  end
end
