module GoalsHelper

    # The two methods below take arguments of update, image, or resource and the goal instance variable.
    # They are called in the _view_latest_activity partial, which is called in the goals show view.
    def add_(object, goal)
        if current_user.projects.primary_or_owner_or_update.include?(goal.project)
            link_to "Add #{object.capitalize}", "/goals/#{goal.id}/#{object}s/new", :class => "btn btn-outline-primary"
        end
    end

    def view_all_(object, goal)
        if "@goal.#{object}s.any?"
            link_to "View All #{object.capitalize}s", "/goals/#{goal.id}/#{object}s", :class => "btn btn-outline-primary"
        end
    end

    # The two methods below are called in the goals show view to create buttons based on user privileges.
    def edit_goal(goal)
        if current_user.projects.primary_or_owner_or_update.include?(goal.project)
            link_to "Edit Goal Details", "/goals/#{goal.id}/edit", :class => "btn btn-outline-primary"
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

    # Logic for dynamically changing goals index title based on filters applied.
    def goals_index_title
        if @filter_applied == "status" || @filter_applied == "priority" || @filter_applied == "difficulty" || @filter_applied == "time_commitment"
            content_tag(:h1, "Goals: #{@filter}")
        elsif @filter_applied == "budget" && @filter == "ASC"
            content_tag(:h1, "All Goals, Sorted by Cost (Low to High)")
        elsif @filter_applied == "budget" && @filter == "DESC"
            content_tag(:h1, "All Goals, Sorted by Cost (High to Low)")
        else
            content_tag(:h1, "All Goals")
        end 
    end
end