class ProjectsController < ApplicationController
    before_action :login_required
    before_action :set_project, only: [:show, :edit, :update, :destroy]



    def new
        @users = User.all
        @project = Project.new
        # 3.times { @project.goals.build }
        @project.goals.build
    end

    def create
        @project = Project.new(project_params)
        @project.collaborations.build(:user_id => current_user.id, :role => "Primary Project Owner")
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
    end

    def edit
    end

    def update
        @project.update(project_params)
        redirect_to project_path(@project)
    end

    def destroy
        @project.destroy
        redirect_to projects_path
    end

    private

    def project_params
        params.require(:project).permit(:address, :overview, goals_attributes: [:id, :title, :description, :budget, :status])
    end

    def set_project
        @project = Project.find(params[:id])
    end
end