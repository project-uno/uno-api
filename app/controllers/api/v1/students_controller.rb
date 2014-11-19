 module API
  module V1
    class StudentsController < ApplicationController
      include UserableController

      def index
        load_students
        render json: @students, status: :ok
      end

      def show
        load_student
        render json: @student, status: :ok
      end

      def create
        registration = Registration.new(student_params)
        render json: registration.create_student!, status: :created
      end

      def update
        load_student
        build_student
        save_student
        render json: @student, status: :ok
      end 

      def destroy
        load_student
        @student.destroy
        head :no_content
      end

      private

      def student_params
        params.require(:student).permit(*user_params)
      end

      def load_student
        @student ||= Student.find(params[:id])
      end

      def load_students
        if params[:section_id].present?
          @students = Section.find(params[:section_id]).students
        else
          @students ||= Student.all
        end
      end

      def build_student
        @student ||= Student.new
        @student.user.attributes = student_params
      end

      def save_student
        @student.save!
      end

    end
  end
end
