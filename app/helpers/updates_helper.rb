module UpdatesHelper

    def add_update
        if current_user.projects.primary_or_owner_or_update.include?(@goal.project)
            link_to "Add an Update for this Goal", new_goal_update_path(@goal)
        end
    end

    def view_all_updates
        if @goal.updates.any?
            link_to "View All Updates for this Goal", goal_updates_path(@goal)
        end
    end

    def view_latest_update
        if @goal.updates.any?
            content_tag(:h6, "#{@goal.updates.last.user.username} -  #{@goal.updates.last.human_readable_date} - #{@goal.updates.last.content}")
        end
    end

end