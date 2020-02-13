module ResourcesHelper

     # called in goals show page to display latest resource
     def view_latest_resource_link
        if @goal.resources.any?
            link_to @goal.resources.last.description, @goal.resources.last.url, :target => "_blank"
        end
    end

end
