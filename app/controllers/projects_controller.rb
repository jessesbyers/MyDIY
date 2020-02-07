class ProjectsController < ApplicationController
    before_action :login_required

    # validates :status, inclusion: { in: %w("Not Started" "In Progress" "Completed"),
    # message: "%{value} is not a valid status" }


    def new
        @users = User.all
        @project = Project.new
        3.times { @project.goals.build }
    end

    def create
        @project = Project.new(project_params)
        @project.collaborations.build(:user_id => current_user.id, :role => "Project Owner")
        if @project.save
            redirect_to project_path(@project)
        else
            render :new
        end
    end

    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        @project.update(project_params)
        redirect_to project_path(@project)
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to projects_path
    end

    private

    def project_params
        params.require(:project).permit(:address, :overview, goals_attributes: [:id, :title, :description, :budget, :status])
    end
end