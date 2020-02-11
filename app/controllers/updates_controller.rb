class UpdatesController < ApplicationController
    before_action :login_required
    before_action :set_goal
    before_action :current_user_can_access, only: [:new, :index, :edit, :destroy]


    def new
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
        @update = Update.find(params[:id])
        @update.destroy
        redirect_to goal_updates_path(@goal)
    end

    private

    def set_goal
        @goal = Goal.find(params[:goal_id])
        @project = @goal.project
    end

    def update_params
        params.require(:update).permit(:content, :date)
    end

    def current_user_can_access
        if !current_user.goals.include?(@goal)
            redirect_to root_path, alert: "You may only view content if you are a collaborator on the project"
            return
        end
    end
end