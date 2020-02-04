class ApplicationController < ActionController::Base
    include ApplicationHelper

    # shouldn't need to add session as argument
# only user for controllers
    private

    def login_required
        if !logged_in?
            redirect_to login_path
            return
        end
    end

end
