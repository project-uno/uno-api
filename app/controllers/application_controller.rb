class ApplicationController < ActionController::Base
  def wrap_in_rescue
    yield
  rescue ActiveRecord::RecordInvalid => error
    render json: {error: error.to_s }, status: 400
  end
end
