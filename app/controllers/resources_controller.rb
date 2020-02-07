class ResourcesController < ApplicationController
    before_action :set_goal

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
    end

    def resource_params
        params.require(:resource).permit(:url, :description)
    end
end
