module ResourcesHelper

    def view_latest_resource_link
        if @goal.updates.any?
            link_to @goal.resources.last.description, @goal.resources.last.url, :target => "_blank"
        end
    end

end
