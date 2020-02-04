class ProjectsController < ApplicationController
    # validates :status, inclusion: { in: %w("Not Started" "In Progress" "Completed"),
    # message: "%{value} is not a valid status" }


    def new
        @project = Project.new
        3.times { @project.goals.build }
    end

    def create
        raise params.inspect
        @project = Project.new(project_params)
        if @project.save
            redirect_to project_path(@project)
        end
    end

    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end

    private

    def project_params
        params.require(:project).permit(:address, :user_ids, goals_attributes: [:title, :description, :budget, :status])
    end
end