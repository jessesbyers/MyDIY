module ImagesHelper

    # called in goals show page to display latest image
    def view_latest_image
        if @goal.images.any?
            image_tag(@goal.images.last.url)
        end
    end

end