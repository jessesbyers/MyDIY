class UpdatesController < ApplicationController
    before_action :set_goal

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

    private

    def set_goal
        @goal = Goal.find(params[:goal_id])
    end

    def update_params
        params.require(:update).permit(:content, :date)
    end
end