module ResourcesHelper

    def add_resource
        if current_user.projects.primary_or_owner_or_update.include?(@goal.project)
            link_to "Add a Resource for this Goal", new_goal_resource_path(@goal)
        end
    end

    def view_all_resources
        if @goal.resources.any?
            link_to "View All Resources for this Goal", goal_resources_path(@goal)
        end
    end

    def view_latest_resource_link
        if @goal.updates.any?
            link_to @goal.resources.last.description, @goal.resources.last.url, :target => "_blank"
        end
    end

end
