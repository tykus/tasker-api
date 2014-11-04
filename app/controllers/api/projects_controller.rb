module Api
  class ProjectsController < ApplicationController

    def index
      @projects = Project.all
      render :index
    end

  end
end
