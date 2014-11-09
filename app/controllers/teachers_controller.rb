class TeachersController < ApplicationController
  around_action :wrap_in_rescue, only: :register

  def register
    registration = Registration.new(teacher_params)
    render json: registration.create_teacher!
  end

  private

  def teacher_params
    params.permit(:first_name, :last_name, :email)
  end

end
