class ApplicationController < ActionController::Base
  # TODO: Add authentication

  def wrap_in_rescue
    yield
  rescue ActiveRecord::RecordInvalid => error
    render json: {error: error.to_s }, status: 400
  end
end
