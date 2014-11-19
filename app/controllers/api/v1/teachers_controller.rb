module API
  module V1
    class TeachersController < ApplicationController
      include UserableController

      def index
        load_teachers
        render json: @teachers, status: :ok
      end

      def show
        load_teacher
        render json: @teacher, status: :ok
      end

      def create
        registration = Registration.new(teacher_params)
        render json: registration.create_teacher!, status: :created
      end

      def update
        load_teacher
        build_teacher
        save_teacher
        render json: @teacher, status: :ok
      end

      def destroy
        load_teacher
        @teacher.destroy
        head :no_content
      end

      private

      def teacher_params
        params.require(:teacher).permit(*user_params)
      end

      def load_teacher
        @teacher ||= Teacher.find(params[:id])
      end

      def load_teachers
        @teachers ||= Teacher.all
      end

      def build_teacher
        @teacher ||= Teacher.new
        @teacher.user.attributes = teacher_params
      end

      def save_teacher
        @teacher.save!
      end
    end
  end
end
