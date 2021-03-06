class GoalsController < ApplicationController
     before_action :login_required
     before_action :set_goal, only: [:show, :edit, :update, :destroy]

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
        set_goals_for_filter
        @filter_applied = params.keys.first
        @filter = params.values.first
    end

    def edit
        block_access_if_not_primary_or_owner
    end

    def update
        if @goal.update(goal_params)
            redirect_to goal_path(@goal)
        else
            render :edit
        end
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
        params.require(:goal).permit(:title, :project_id, :description, :budget, :status, :difficulty, :priority, :time_commitment, :time_spent, :cost)
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

    def block_access_if_not_collaborator
        if !current_user.projects.collaborator_of_any_kind.include?(@goal.project)
            redirect_to root_path, alert: "You may only view this page if you are a Project Collaborator."
            return
        end
    end

    # logic for setting instance variable @goals for filtering goals index view.
    def set_goals_for_filter
        if params[:status]
            status = params[:status]
            @goals = current_user.goals.filter_status(status)
        elsif params[:priority]
            priority = params[:priority]
            @goals = current_user.goals.filter_priority(priority)
        elsif params[:difficulty]
            difficulty = params[:difficulty]
            @goals = current_user.goals.filter_difficulty(difficulty)
        elsif params[:time_commitment]
            time_commitment = params[:time_commitment]
            @goals = current_user.goals.filter_time_commitment(time_commitment)
        elsif params[:budget]
            budget = params[:budget]
            @goals = current_user.goals.sort_budget(budget)
        else
            @goals = current_user.goals.order("project_id")
        end
    end

end