module API
  module V1
    class ProjectsController < ApplicationController

      before_action :get_project, only: [:show, :update, :destroy]

      def index
        @projects = Project.all
        if query = params[:query]
          @projects = @projects.where("title LIKE :query", query: "%#{query}%")
        end
        render :index
      end

      def show
        render :show
      end

      def create
        project = Project.new project_params
        if project.save
          render json: project, status: :created, location: api_v1_project_url(project[:id])
        else
          render json: project.errors, status: :unprocessable_entity
        end
      end

      def update
        if @project.update(project_params)
          render json: @project, status: 200
        end
      end

    private
      def get_project
        @project = Project.find(params[:id])
      end

      def project_params
        params.require(:project).permit(:title, :description, :due_date, :start_date, :end_date, :assigned_to)
      end

    end
  end
end
