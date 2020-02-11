class CollaborationsController < ApplicationController
    before_action :login_required
    before_action :set_collaboration, only: [:edit, :update, :destroy]
    # need to fix - new and edit blocked
    before_action :current_user_can_access


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
        @collaboration.update(collaboration_params)
        redirect_to project_path(@collaboration.project)
    end

    def destroy
        @collaboration.delete
        redirect_to project_path(@collaboration.project)
    end

    private
    
    def collaboration_params
        params.require(:collaboration).permit(:user_id, :project_id, :role)
    end

    def set_collaboration
        @collaboration = Collaboration.find(params[:id])
    end

    def current_user_can_access
        if !current_user.collaborations.include?(@collaboration)
            redirect_to root_path, alert: "You may only view content if you are a collaborator on the project"
            return
        end
    end
end