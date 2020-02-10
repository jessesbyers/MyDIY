class GoalsController < ApplicationController
     before_action :login_required
     before_action :set_goal, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
        @goal = Goal.new
    end

    def create
        @goal = Goal.new(goal_params)
        if @goal.save
            redirect_to goal_path(@goal)
        else
            render :new
        end
    end

    def index
        @goals = current_user.goals.order("project_id")
    end

    def edit
    end

    def update
        @goal.update(goal_params)
        redirect_to goal_path(@goal)
    end

    def destroy
        @goal.destroy
        redirect_to project_path(@goal.project)
    end

    def completed
        @goals = current_user.goals.completed
    end

    private

    def goal_params
        params.require(:goal).permit(:title, :project_id, :description, :budget, :status)
    end

    def set_goal
        @goal = Goal.find(params[:id])
    end
end