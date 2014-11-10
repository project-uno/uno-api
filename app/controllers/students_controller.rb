class StudentsController < ApplicationController
  include UserableController

  def register
    registration = Registration.new(student_params)
    render json: registration.create_student!
  end

  private

  def student_params
    user_params
  end
end
