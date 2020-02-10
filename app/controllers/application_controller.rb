class ApplicationController < ActionController::Base
    include ApplicationHelper

    private

    def login_required
        if !logged_in?
            redirect_to login_path
            return
        end
    end

    def current_user_is_collaborator
        if !Collaboration.project_user_is_collaborator(current_user).include?(@project)
            redirect_to projects_path, alert: "You may only view content if you are a collaborator on the project"
            return
        end
    end

end
