module Api
  module V1
    class StudentsController < ApplicationController
      include UserableController

      def create
        registration = Registration.new(student_params)
        render json: registration.create_student!
      end

      private

      def student_params
        params.require(:student).permit(*user_params)
      end
    end
  end
end
