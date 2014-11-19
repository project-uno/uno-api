module API
  module V1
    class SubjectsController < ApplicationController

      around_action :wrap_in_rescue, only: [ :create, :show, :destroy, :update]

      def index
        load_subjects
        render json: @subjects
      end

      def show
        load_subject
        render json: @subject, status: :ok
      end

      def create
        build_subject
        save_subject
        render json: @subject, status: :created
      end

      def update
        load_subject
        build_subject
        save_subject
        render json: @subject, status: :ok
      end

      def destroy
        load_subject
        @subject.destroy
        head :no_content
      end

      private

      def subject_params
        params.require(:subject).permit(:name, :description, :teacher_id)
      end

      def load_subject
        @subject ||= Subject.find(params[:id])
      end

      def load_subjects
        if params[:teacher_id].present?
          @subjects = Teacher.find(params[:teacher_id]).subjects
        end
      end

      def build_subject
        @subject ||= Subject.new
        @subject.attributes = subject_params
      end

      def save_subject
        @subject.save!
      end

    end
  end
end
