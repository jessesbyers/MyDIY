class UpdatesController < ApplicationController
    before_action :login_required
    before_action :set_goal
    before_action :block_access_if_not_collaborator, only: [:index, :edit]

    def new
        block_access_if_view_only
        @update = @goal.updates.build
    end

    def create
        @update = @goal.updates.build(update_params)
        @update.user_id = current_user.id
        @update.date = Time.now
        if @update.save
            redirect_to goal_path(@goal)
        else
            render :new
        end
    end

    def index
        @updates = @goal.updates
    end

    def destroy
        # block_access_if_not_primary_owner
        @update = Update.find(params[:id])
        @update.destroy
        redirect_to goal_updates_path(@goal)
    end

    private

    def set_goal
        @goal = Goal.find(params[:goal_id])
    end

    def update_params
        params.require(:update).permit(:content, :date)
    end

    def block_access_if_view_only
        if current_user.projects.view_only.include?(@goal.project)
            redirect_to root_path, alert: "You do not have permission to create an update."
            return
        end
    end

    def block_access_if_not_primary_owner
        if !current_user.projects.primary_owner.include?(@goal.project)
            redirect_to root_path, alert: "You may only delete an update if you are the Primary Project Owner."
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