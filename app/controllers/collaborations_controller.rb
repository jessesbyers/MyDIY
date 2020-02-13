class CollaborationsController < ApplicationController
    before_action :login_required
    before_action :block_access_if_not_primary_owner, only: [:new, :edit, :update, :destroy]
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
    end

    def update
        if @collaboration.update(collaboration_params)
            redirect_to project_path(@collaboration.project)
        else
            render :edit
        end
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

    def block_access_if_not_primary_owner
        if current_user.projects.primary_owner.empty?
            redirect_to root_path, alert: "You may only create or edit a collaboration if you are the Primary Project Owner."
            return
        end
    end
end