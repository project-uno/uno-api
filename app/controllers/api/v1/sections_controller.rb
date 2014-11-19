module API
  module V1
    class SectionsController < ApplicationController

      around_action :wrap_in_rescue, only: [ :create, :show, :destroy, :update]

      def index
        load_sections
        render json: @sections, status: :ok
      end

      def show
        load_section
        render json: @section, status: :ok
      end

      def create
        build_section
        save_section
        render json: @section, status: :created
      end

      def update
        load_section
        build_section
        save_section
        render json: @section, status: :ok
      end

      def destroy
        load_section
        @section.destroy
        head :no_content
      end

      private

      def section_params
        params.require(:section).permit(:name, :level)
      end

      def load_sections
        @sections ||= Section.all
      end 

      def load_section
        @section ||= Section.find(params[:id])
      end

      def build_section
        @section ||= Section.new
        @section.attributes = section_params
      end

      def save_section
        @section.save!
      end

    end
  end
end
