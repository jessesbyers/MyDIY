class ImagesController < ApplicationController
    # before_action :set_goal

    def new
        @goal = Goal.find(params[:goal_id])

        @image = @goal.images.build

    end

    def create
        @goal = Goal.find(params[:goal_id])

        @image = @goal.images.build(image_params)
        @image.user_id = current_user.id
        if @image.save
            redirect_to goal_images_path(@goal)
        else
            render :new
        end
    end

    def index
        @goal = Goal.find(params[:goal_id])

        @images = @goal.images
    end

    def show
    end

    def destroy
        @image = Image.find(params[:id])
        @image.destroy
        # need to find a better way to redirect - can't access @goal or @project
        redirect_to root_path
    end


    private

    def set_goal
        @goal = Goal.find(params[:goal_id])
    end

    def image_params
        params.require(:image).permit(:url, :caption, :genre)
    end
end