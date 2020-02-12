module GoalsHelper

    def add_(object, goal)
        if current_user.projects.primary_or_owner_or_update.include?(goal.project)
            link_to "Add an #{object.capitalize} for this Goal", "/goals/#{goal.id}/#{object}s/new"
        end
    end

    def view_all_(object, goal)
        if "@goal.#{object}s.any?"
            link_to "View All #{object.capitalize}s for this Goal", "/goals/#{goal.id}/#{object}s"
        end
    end

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


 # This loop renders HTML as a return value, so .join transforms it into a string.
    def list_goals(status)
        status.map do |goal|
            render "goal_details", {goal: goal} 
        end.join
    end

end