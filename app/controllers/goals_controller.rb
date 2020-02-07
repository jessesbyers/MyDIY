class GoalsController < ApplicationController
     before_action :login_required

    def show
        @goal = Goal.find(params[:id])
    end

    def new
        @goal = Goal.new
    end

    def create
        @goal = Goal.new(goal_params)
        if @goal.save
            redirect_to project_path(@goal.project)
        else
            render :new
        end
    end

    def index
        @goals = current_user.goals
    end

    def edit
        @goal = Goal.find(params[:id])
    end

    def update
        @goal = Goal.find(params[:id])
        @goal.update(goal_params)
        redirect_to goal_path(@goal)
    end

    def destroy
        @goal = Goal.find(params[:id])
        @goal.destroy
        redirect_to project_path(@goal.project)
    end

    private

    def goal_params
        params.require(:goal).permit(:title, :project_id, :description, :budget, :status)
    end
end