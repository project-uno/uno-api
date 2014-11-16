module API
  module V1
    class SubjectsController < ApplicationController

      def show
        load_subject
        render json: @subject, status: :ok
      rescue ActiveRecord::RecordNotFound => error
        render json: {error: error.to_s }, status: :not_found
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
      rescue ActiveRecord::RecordNotFound => error
        render json: {error: error.to_s }, status: :not_found
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
        if @subject.save
          render json: @subject, status: successful_status
        else
          render json: {error: @subject.errors }, status: :unprocessable_entity
        end
      end

    end
  end
end
