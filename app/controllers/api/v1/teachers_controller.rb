module API
  module V1
    class TeachersController < ApplicationController
      include UserableController

      def create
        registration = Registration.new(teacher_params)
        render json: registration.create_teacher!, status: :created
      end

      private

      def teacher_params
        params.require(:teacher).permit(*user_params)
      end
    end
  end
end
