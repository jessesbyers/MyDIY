class ImagesController < ApplicationController
    before_action :set_goal

    def new
        @image = @goal.images.build

    end

    def create
        @image = @goal.images.build(image_params)
        @image.user_id = current_user.id
        if @image.save
            redirect_to goal_images_path(@goal)
        else
            render :new
        end
    end

    def index
        @images = @goal.images
    end

    private

    def set_goal
        @goal = Goal.find(params[:goal_id])
    end

    def image_params
        params.require(:image).permit(:url, :caption, :genre)
    end
end