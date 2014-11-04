module API
  module V1
    class ProjectsController < ApplicationController

      before_action :get_project, only: [:show, :update, :destroy]

      def index
        @projects = Project.all
        render :index
      end

      def show
        render :show
      end

      def create
        @project = Project.create(project_params)
      end

      def update
        @project.update_attributes!(project_params)
      end

      def destroy
        @project.destroy
      end

    private
      def get_project
        @project = Project.find(params[:id])
      end

      def project_params
        params.permit(:title, :description, :due_date, :start_date, :end_date, :assigned_to)
      end

    end
  end
end
