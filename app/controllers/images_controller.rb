class ImagesController < ApplicationController
    before_action :login_required
    before_action :set_goal
    before_action :current_user_can_access, only: [:new, :destroy]


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
        @goal = Goal.find(params[:goal_id])
        @images = @goal.images
    end

    def show
    end

    def destroy
        @image = Image.find(params[:id])
        @image.destroy
        redirect_to goal_images_path(@goal)
    end


    private

    def set_goal
        @goal = Goal.find(params[:goal_id])
        @project = @goal.project
    end

    def image_params
        params.require(:image).permit(:url, :caption, :genre)
    end

    def current_user_can_access
        if !current_user.images.include?(@image)
            redirect_to root_path, alert: "You may only view content if you are a collaborator on the project"
            return
        end
    end
end