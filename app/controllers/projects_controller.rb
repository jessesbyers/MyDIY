class ProjectsController < ApplicationController
    before_action :login_required

    # validates :status, inclusion: { in: %w("Not Started" "In Progress" "Completed"),
    # message: "%{value} is not a valid status" }


    def new
        @users = User.all
        @project = Project.new
        3.times { @project.collaborations.build }
        3.times { @project.goals.build }
    end

    def create
        raise params.inspect
        @project = Project.new(project_params)
        @project.user_id = session[:user_id]
        
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

    private

    def project_params
        params.require(:project).permit(:address, :user_ids, goals_attributes: [:title, :description, :budget, :status])
    end
end