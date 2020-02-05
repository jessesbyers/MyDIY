class ApplicationController < ActionController::Base
    include ApplicationHelper

    private

    def login_required
        if !logged_in?
            redirect_to login_path
            return
        end
    end

end
