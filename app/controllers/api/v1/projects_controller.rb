module Api
  module V1
    class ProjectsController < ApplicationController

      def index
        @projects = Project.all
        render :index
      end

    end
  end
end
