class TeachersController < ApplicationController
  include UserableController

  def register
    registration = Registration.new(teacher_params)
    render json: registration.create_teacher!
  end

  private

  def teacher_params
    user_params
  end
end
