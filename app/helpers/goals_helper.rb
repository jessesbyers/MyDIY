module GoalsHelper

    # The two methods below take arguments of update, image, or resource and the goal instance variable.
    # They are called in the _view_latest_activity partial, which is called in the goals show view.
    def add_(object, goal)
        if current_user.projects.primary_or_owner_or_update.include?(goal.project)
            link_to "Add #{object.capitalize} for this Goal", "/goals/#{goal.id}/#{object}s/new"
        end
    end

    def view_all_(object, goal)
        if "@goal.#{object}s.any?"
            link_to "View All #{object.capitalize}s for this Goal", "/goals/#{goal.id}/#{object}s"
        end
    end

    # The two methods below are called in the goals show view to create buttons based on user privileges.
    def edit_goal(goal)
        if current_user.projects.primary_or_owner_or_update.include?(goal.project)
            link_to "Edit Goal Details", "/goals/#{goal.id}/edit" 
        end
    end

    def delete_goal(goal)
        if current_user.projects.primary_owner.include?(goal.project)
            render "/goals/delete_goal"
        end
    end

    # This method is called in the Goals index view to allow sorting goals by completion status.
    # This loop renders HTML as a return value, so .join transforms it into a string that can be rendered in the view properly.
    def list_goals(status)
        status.map do |goal|
            render "goal_details", {goal: goal} 
        end.join
    end

end