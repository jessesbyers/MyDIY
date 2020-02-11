class ResourcesController < ApplicationController
    before_action :login_required
    before_action :set_goal
    before_action :current_user_can_access, only: [:new, :index, :edit, :destroy]


    def new
        @resource = @goal.resources.build
    end

    def create
        @resource = @goal.resources.build(resource_params)
        @resource.user_id = current_user.id
        if @resource.save
            redirect_to goal_path(@goal)
        else
            render :new
        end
    end

    def index
        @resources = @goal.resources
    end

    def destroy
        @resource = Resource.find(params[:id])
        @resource.destroy
        redirect_to goal_resources_path(@goal)

    end

    private

    def set_goal
        @goal = Goal.find(params[:goal_id])
        @project = @goal.project
    end

    def resource_params
        params.require(:resource).permit(:url, :description)
    end

    def current_user_can_access
        if !current_user.goals.include?(@goal)
            redirect_to root_path, alert: "You may only view content if you are a collaborator on the project"
            return
        end
    end
end
