class ImagesController < ApplicationController
    before_action :login_required
    before_action :set_goal
    before_action :block_access_if_not_collaborator, only: [:index, :edit]


    def new
        block_access_if_view_only
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

    def block_access_if_view_only
        if current_user.projects.view_only.include?(@goal.project)
            redirect_to root_path, alert: "You do not have permission to create an image."
            return
        end
    end

    def block_access_if_not_collaborator
        if !current_user.projects.collaborator_of_any_kind.include?(@goal.project)
            redirect_to root_path, alert: "You may only view this page if you are a Project Collaborator."
            return
        end
    end
end