class ProjectsController < ApplicationController
    before_action :login_required 
    before_action :set_project, only: [:show, :edit, :update, :destroy]


    def new
        @project = Project.new
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
        block_access_if_not_collaborator
    end

    def edit
        block_access_if_not_primary_owner
    end

    def update
        if @project.update(project_params)
            redirect_to project_path(@project)
        else
            render :edit
        end
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

    def block_access_if_not_primary_owner
        if !current_user.projects.primary_owner.include?(@project)
            redirect_to root_path, alert: "You may only edit or delete a project if you are the Primary Project Owner."
            return
        end
    end

    def block_access_if_not_collaborator
        if !current_user.projects.collaborator_of_any_kind.include?(@project)
            redirect_to root_path, alert: "You may only view this page if you are a Project Collaborator."
            return
        end
    end
end