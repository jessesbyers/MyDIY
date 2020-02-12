class GoalsController < ApplicationController
     before_action :login_required
     before_action :set_goal, only: [:show, :edit, :update, :destroy]
     before_action :block_access_if_not_primary_or_owner, only: [:edit]


    def show
        block_access_if_not_collaborator
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
        return
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

    def block_access_if_not_primary_or_owner
        if !current_user.projects.primary_or_owner.include?(@goal.project)
            redirect_to root_path, alert: "You may only create or edit a goal if you are a Project Owner."
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