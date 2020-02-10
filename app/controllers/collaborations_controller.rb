class CollaborationsController < ApplicationController
    before_action :login_required
    before_action :set_collaboration, only: [:edit, :update, :destroy]

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
        @collaboration = Collaboration.find(params[:id])
    end

    def update
        @collaboration = Collaboration.find(params[:id])
        @collaboration.update(collaboration_params)
        redirect_to project_path(@collaboration.project)
    end

    def destroy
        @collaboration = Collaboration.find(params[:id])
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
end