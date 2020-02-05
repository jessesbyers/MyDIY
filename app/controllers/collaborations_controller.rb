class CollaborationsController < ApplicationController
    before_action :login_required

    def new
        @collaboration = Collaboration.new
    end

    def create
        @collaboration = Collaboration.new(collaboration_params)
        if @collaboration.save
            redirect_to project_path(@collaboration.project)
        else
            render :new
        end
    end

    def edit
    end

    def update
    end

    private
    
    def collaboration_params
        params.require(:collaboration).permit(:user_id, :project_id, :role)
    end

end