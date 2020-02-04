class ProjectsController < ApplicationController
    accepts_nested_attributes_for :goals
    accepts_nested_attributes_for :users


    def new
        @project = Project.new
        3.times { @project.goals.build }
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