module GoalsHelper

    def add_(object, goal)
        if current_user.projects.primary_or_owner_or_update.include?(goal.project)
            # link_to "Add an #{object.capitalize} for this Goal", "new_goal_#{object}_path(goal)"
            link_to "Add an #{object.capitalize} for this Goal", "/goals/#{goal.id}/#{object}s/new"

        end
    end

    def view_all_(object, goal)
        if "@goal.#{object}s.any?"
            link_to "View All #{object.capitalize}s for this Goal", "/goals/#{goal.id}/#{object}s"

        end
    end
end