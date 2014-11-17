module API
  module V1
    class SubjectsController < ApplicationController

      around_action :wrap_in_rescue, only: [ :create, :show, :destroy, :update]

      def show
        load_subject
        render json: @subject, status: :ok
      end

      def create
        build_subject
        save_subject(successful_status: :created)
      end

      def update
        load_subject
        build_subject
        save_subject(successful_status: :ok)
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

      def build_subject
        @subject ||= Subject.new
        @subject.attributes = subject_params
      end

      def save_subject(successful_status: successful_status)
        @subject.save!
        render json: @subject, status: successful_status
      end

    end
  end
end
