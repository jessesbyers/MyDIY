module ImagesHelper

    def add_image
        if current_user.projects.primary_or_owner_or_update.include?(@goal.project)
            link_to "Add an Image for this Goal", new_goal_image_path(@goal)
        end
    end

    def view_all_images
        if @goal.images.any?
            link_to "View All Images for this Goal", goal_images_path(@goal)
        end
    end


    def view_latest_image
        if @goal.images.any?
            image_tag(@goal.images.last.url)
        end
    end

end