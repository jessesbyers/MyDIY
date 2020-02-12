class ResourcesController < ApplicationController
    before_action :login_required
    before_action :set_goal
    before_action :block_access_if_not_collaborator, only: [:index, :edit]


    def new
        block_access_if_view_only
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
        block_access_if_not_primary_owner
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

    def block_access_if_view_only
        if current_user.projects.view_only.include?(@goal)
            redirect_to root_path, alert: "You do not have permission to create a goal."
            return
        end
    end

    def block_access_if_not_primary_owner
        if !current_user.projects.primary_owner.include?(@goal)
            redirect_to root_path, alert: "You may only delete a goal if you are the Primary Project Owner."
            return
        end
    end

    def block_access_if_not_collaborator
        if !current_user.projects.collaborator_of_any_kind.include?(@goal.project)
            redirect_to root_path, alert: "You may only view this page if you are a Project Collaborator."
            return
        end
    end
end
