class ProjectsController < ApplicationController

    def new
        @project = Project.new
    end

    def create
    end

    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end

    private

    def project_params
        params.require[:project].permit[:address, :user_id, :goal_id]
    end
end