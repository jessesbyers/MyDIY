class ImagesController < ApplicationController
    before_action :set_goal

    def new
        @image = @goal.images.build

    end

    def create
        raise params.inspect
    end

    def index
    end

    private

    def set_goal
        @goal = Goal.find(params[:goal_id])
    end

    def image_params
        params.require(:resource).permit(:url, :caption, :type)
    end
end