module Api
  module V1
    class ProjectsController < ApplicationController

      before_action :get_project

      def index
        @projects = Project.all
        render :index
      end

      def show
        render :show
      end

      def create
        @project = Project.create({
            :title => params[:title],
            :description => params[:description]
        })
      end

      def update
        @project.update(params)
      end

      def destroy

      end

      private
        def get_project
          @project = Project.find(params[:id])
        end

    end
  end
end
