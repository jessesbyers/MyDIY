module GoalsHelper

    def add_(object)
        if current_user.projects.primary_or_owner_or_update.include?(@goal.project)
            link_to "Add an #{object.capitalize} for this Goal", "new_goal_#{object}_path(@goal)"
        end
    end

    def view_all_(object)
        if "@goal.#{object}s.any?"
            link_to "View All #{object.capitalize}s for this Goal", "goal_#{object}s_path(@goal)"
        end
    end
end