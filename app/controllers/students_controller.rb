class StudentsController < ApplicationController
  around_action :wrap_in_rescue, only: :register

  def register
    registration = Registration.new(student_params)
    render json: registration.create_student!
  end

  private

  def student_params
    params.permit(:first_name, :last_name, :email)
  end
end
