class ApplicationController < ActionController::Base
    include ApplicationHelper

    private

    def login_required
        if !logged_in?
            redirect_to login_path
            return
        end
    end

    # def current_user_can_view
    #     if !current_user.collaborations.include?(object)
    #         redirect_to root_path, alert: "You may only view content if you are a collaborator on the project"
    #         return
    #     end
    # end

end
